#include <htc.h>         
#include <stdio.h>       // printf 

//=============================================================================
// 1. Configuration & Constants
//=============================================================================

#define _XTAL_FREQ 3570000  

#define SDA_PIN    RB3        // Define SDA line as RB3
#define SCL_PIN    RB4        // Define SCL line as RB4
#define SDA_TRIS   TRISB3     // SDA direction control
#define SCL_TRIS   TRISB4     // SCL direction control

#define EEPROM_ADDR 0xA0      // Base address for 24Cxx EEPROM (write mode)

#define SDA_OUT(x)      { SDA_TRIS = 0; SDA_PIN = x; }  // Output x on SDA
#define SDA_IN()        (SDA_PIN)                       // Read SDA pin
#define SDA_RELEASE()   { SDA_TRIS = 1; }               // Make SDA input
#define SCL_HIGH()      { SCL_PIN = 1; i2c_wait(); }    // Pull SCL high with delay
#define SCL_LOW()       { SCL_PIN = 0; i2c_wait(); }    // Pull SCL low with delay

#define I2C_SUCCESS     0      // Operation successful
#define I2C_FAIL        1      // Operation failed
#define SEND_ACK        0      // Send ACK bit
#define SEND_NACK       1      // Send NACK bit

//=============================================================================
// 2. UART Initialization & Transmission
//=============================================================================

void uart_init(void) {
    SPBRG = 46;        // Set baud rate register for 4800 baud
    BRGH = 1;          // Enable high-speed baud rate
    SYNC = 0;          // Asynchronous mode
    SPEN = 1;          // Enable serial port
    TXEN = 1;          // Enable transmitter
    CREN = 1;          // Enable receiver
}

void putch(char c) {
    while (!TXIF);     // Wait until TX register is empty
    TXREG = c;         // Load character into TX register
}

//=============================================================================
// 3. I2C Protocol - Bit-Banged
//=============================================================================

void i2c_wait() {
    __delay_us(5);     // Short delay to set ~100kHz I2C speed
}

void i2c_start() {
    SDA_OUT(1);        // Ensure SDA is high
    SCL_HIGH();        // Set SCL high
    SDA_OUT(0);        // Pull SDA low while SCL is high (START condition)
    SCL_LOW();         // Pull SCL low to start data transmission
}

void i2c_stop() {
    SDA_OUT(0);        // Pull SDA low
    SCL_HIGH();        // Raise SCL
    SDA_OUT(1);        // Raise SDA while SCL is high (STOP condition)
    i2c_wait();        // Short delay
}

unsigned char i2c_read_ack() {
    unsigned char ack;
    SDA_RELEASE();     // Release SDA line so slave can drive it
    SCL_HIGH();        // Clock high to read ACK bit
    ack = SDA_IN();    // Read slave ACK (0 = ACK, 1 = NACK)
    SCL_LOW();         // Clock low to end bit
    return ack;        // Return ACK status
}

void i2c_send_ack(unsigned char ack) {
    SDA_OUT(ack);      // Send ACK (0) or NACK (1)
    SCL_HIGH();        // Clock high to transmit bit
    SCL_LOW();         // Clock low to end bit
}

unsigned char i2c_write_byte(unsigned char data) {
    for (char i = 0; i < 8; i++) {
        SDA_OUT((data & 0x80) ? 1 : 0); // Send MSB first
        SCL_HIGH();                     // Clock high
        SCL_LOW();                      // Clock low
        data <<= 1;                     // Shift to next bit
    }
    return i2c_read_ack();              // Wait for ACK from slave
}

unsigned char i2c_read_byte(unsigned char ack) {
    unsigned char data = 0;
    SDA_RELEASE();                      // Release SDA for input
    for (char i = 0; i < 8; i++) {
        data <<= 1;                     // Shift previous bits
        SCL_HIGH();                     // Clock high
        if (SDA_IN()) data |= 1;        // Read current bit
        SCL_LOW();                      // Clock low
    }
    i2c_send_ack(ack);                  // Send ACK/NACK after read
    return data;                        // Return byte
}

//=============================================================================
// 4. EEPROM 
//=============================================================================

unsigned char eeprom_write_byte(unsigned int addr, unsigned char data) {
    i2c_start();                                // Start condition
    if (i2c_write_byte(EEPROM_ADDR | 0x00)) goto fail;    // Send device address (write)
    if (i2c_write_byte((addr >> 8) & 0xFF)) goto fail;     // Send MSB of address
    if (i2c_write_byte(addr & 0xFF))      goto fail;       // Send LSB of address
    if (i2c_write_byte(data))             goto fail;       // Send data byte
    i2c_stop();                           // Stop condition
    __delay_ms(5);                        // EEPROM write delay
    return I2C_SUCCESS;                   // Success
fail:
    i2c_stop();                           // Abort transmission
    return I2C_FAIL;                      // Failure
}

unsigned char eeprom_read_byte(unsigned int addr, unsigned char* data) {
    i2c_start();                                // Start condition
    if (i2c_write_byte(EEPROM_ADDR | 0x00)) goto fail;    // Send device address (write mode)
    if (i2c_write_byte((addr >> 8) & 0xFF)) goto fail;     // MSB of address
    if (i2c_write_byte(addr & 0xFF))      goto fail;       // LSB of address

    i2c_start();                                // Repeated start
    if (i2c_write_byte(EEPROM_ADDR | 0x01)) goto fail;    // Send device address (read mode)

    *data = i2c_read_byte(SEND_NACK);           // Read one byte and send NACK
    i2c_stop();                                 // Stop condition
    return I2C_SUCCESS;                         // Success
fail:
    i2c_stop();                                 // Abort transmission
    return I2C_FAIL;                            // Failure
}

//=============================================================================
// 5. Main Program
//=============================================================================

void main(void) {
    ANSEL = 0x00;         // All analog functions off (digital mode)
    ANSELH = 0x00;
    SDA_TRIS = 0;         // Set SDA as output initially
    SCL_TRIS = 0;         // Set SCL as output initially
    uart_init();          // Initialize UART

    printf("\r\n== EEPROM Test @ RB3(SDA), RB4(SCL) ==\r\n");

    // --- EEPROM WRITE ---
    printf("Writing A–J to 0x0000–0x0009...\r\n");
    for (char i = 0; i < 10; i++) {
        unsigned int addr = i;           // Address to write
        char val = 'A' + i;              // Data: 'A' to 'J'
        printf("Writing '%c' to 0x%04X... ", val, addr);
        if (eeprom_write_byte(addr, val) == I2C_SUCCESS)
            printf("OK\r\n");
        else
            printf("FAIL\r\n");
    }

    // --- EEPROM READ + VERIFY ---
    printf("\r\nVerifying data...\r\n");
    unsigned char err = 0;
    for (char i = 0; i < 10; i++) {
        unsigned char val;               // Variable to store read data
        unsigned int addr = i;           // Address to read
        char expected = 'A' + i;         // Expected value
        printf("Reading 0x%04X... ", addr);
        if (eeprom_read_byte(addr, &val) == I2C_SUCCESS) {
            printf("Got '%c' – %s\r\n", val, (val == expected) ? "Match" : "Mismatch!");
            if (val != expected) err++;
        } else {
            printf("Read Fail\r\n");
            err++;
        }
    }

    // --- Summary ---
    printf("\r\nTest Complete. Errors: %u\r\n", err);

    while(1);             // Halt here (infinite loop)
}




