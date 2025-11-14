library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pulse_generator is
    port (
        clk      : in  std_logic;
        reset_n  : in  std_logic;
        in_pulse : in  std_logic;
        out_pulse: out std_logic
    );
end entity;

architecture rtl of pulse_generator is
    signal counter : integer := 0;
    signal active  : std_logic := '0';
begin
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            counter   <= 0;
            active    <= '0';
            out_pulse <= '0';
        elsif rising_edge(clk) then
            if in_pulse = '1' and active = '0' then
                active  <= '1';
                counter <= 150;  -- fixed width output pulse
                out_pulse <= '1';
            elsif active = '1' then
                if counter > 0 then
                    counter <= counter - 1;
                    out_pulse <= '1';
                else
                    active <= '0';
                    out_pulse <= '0';
                end if;
            else
                out_pulse <= '0';
            end if;
        end if;
    end process;
end rtl;
