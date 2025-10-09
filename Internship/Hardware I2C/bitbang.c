#include <htc.h>
#include <stdio.h>
#define _XTAL_FREQ 3570000 
// ===== UART Functions =====
void UART_Init(long baud) {
    unsigned int x;
    x = (_XTAL_FREQ - baud*64)/(baud*64); 
    if (x > 255) { 
        x = (_XTAL_FREQ - baud*16)/(baud*16); 
        BRGH = 1;
    }
    if (x < 256) SPBRG = x;
    SYNC = 0;      // Async mode
    SPEN = 1;      // Enable serial port
    TRISC6 = 1;    // TX pin
    TRISC7 = 1;    // RX pin
    TXEN = 1;      // Enable transmitter
    CREN = 1;      // Enable receiver
}
void UART_Write(char data) {
    while(!TXIF);
    TXREG = data;
}
void UART_Write_Text(const char *text) {
    while(*text) UART_Write(*text++);
}
// ===== I2C Functions ===== 
void I2C_Init(void) {
    TRISC3 = 1; // SCL
    TRISC4 = 1; // SDA
    SSPADD = 9;         // 100kHz 
    SSPSTAT = 0x80;     // Slew rate disabled
    SSPCON = 0x28;      // Enable MSSP in I2C Master mode
    SSPCON2 = 0x00;
}
void I2C_Wait(void) {
    while ((SSPCON2 & 0x1F) || (SSPSTAT & 0x04)); // Wait till idle
}
void I2C_Start(void) {
    I2C_Wait();
    SEN = 1;
}
void I2C_Stop(void) {
    I2C_Wait();
    PEN = 1;
}
void I2C_Restart(void) {
    I2C_Wait();
    RSEN = 1;
}
void I2C_Write(unsigned char data) {
    I2C_Wait();
    SSPBUF = data;
    while(!SSPIF);
    SSPIF = 0;
}
unsigned char I2C_Read(unsigned char ack) {
    unsigned char data;
    I2C_Wait();
    RCEN = 1;
    I2C_Wait();
    data = SSPBUF;
    I2C_Wait();
    ACKDT = (ack) ? 0 : 1; // 0=ACK, 1=NACK
    ACKEN = 1;
    return data;
}
// ===== Main =====
void main(void) {
    unsigned char data_sent = 0x55;
    
    UART_Init(9600);
    I2C_Init();
    UART_Write_Text("I2C Write Test Start\r\n");
    while (1) {
        // Send data over I2C
        I2C_Start();
        I2C_Write(0xA0);   // Slave + Write
        I2C_Write(0x10);   // Memory address
        I2C_Write(data_sent);   // Data
        I2C_Stop();
        // Log over UART
        UART_Write_Text("Sent: 0x");
        char buf[5];
        sprintf(buf, "%02X", data_sent);
        UART_Write_Text(buf);
        UART_Write_Text("\r\n");
        __delay_ms(1000);
    }
}