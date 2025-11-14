library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_pulse_generator is
end tb_pulse_generator;

architecture sim of tb_pulse_generator is
    signal clk       : std_logic := '0';
    signal reset_n   : std_logic := '0';
    signal in_pulse  : std_logic := '0';
    signal out_pulse : std_logic;

    constant CLK_PERIOD : time := 20 ns; -- 50 MHz
begin
    -- DUT
    uut: entity work.pulse_generator
        generic map (
            CLK_FREQ_HZ => 50_000_000,
            PULSE_US    => 3
        )
        port map (
            clk       => clk,
            reset_n   => reset_n,
            in_pulse  => in_pulse,
            out_pulse => out_pulse
        );

    -- Clock generator
    clk <= not clk after CLK_PERIOD/2;

    -- Stimulus process
    stim_proc: process
        procedure send_pulse(width : time) is
        begin
            in_pulse <= '1';
            wait for width;
            in_pulse <= '0';
            wait for 2 us; -- gap between pulses
        end procedure;
    begin
        -- Reset
        reset_n <= '0';
        wait for 100 ns;
        reset_n <= '1';
        wait for 200 ns;

        -- Apply pulses
        send_pulse(2 us);  -- shorter than output
        send_pulse(5 us);  -- longer than output
        send_pulse(1 us);  -- minimal
        send_pulse(3 us);  -- equal
        send_pulse(10 us); -- much longer

        wait for 50 us;
        assert false report "Simulation finished" severity failure;
    end process;
end sim;
