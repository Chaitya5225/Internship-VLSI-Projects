
library ieee;
use ieee.std_logic_1164.all;


entity task_1 is
    port (
        clk      : in  std_logic;
        reset    : in  std_logic;
        wave_20ns : out std_logic;
        wave_40ns : out std_logic;
        wave_80ns : out std_logic
    );
end entity task_1;

architecture Behavioral of task_1 is
   
    signal counter : integer range 0 to 7 := 0;
begin

    process (clk, reset)
    begin
        if reset = '1' then
            
            counter   <= 0;
            wave_20ns <= '0';
            wave_40ns <= '0';
            wave_80ns <= '0';
            
        
        elsif (clk'event and clk = '1') then
            
            
            if counter = 7 then
                counter <= 0;
            else
                counter <= counter + 1;
            end if;

            -- Case statement defines the output at each 10ns step
            case counter is
                when 0 =>
                    wave_20ns <= '1'; wave_40ns <= '1'; wave_80ns <= '1';
                when 1 =>
                    wave_20ns <= '0';
                when 2 =>
                    wave_20ns <= '1'; wave_40ns <= '0';
                when 3 =>
                    wave_20ns <= '0';
                when 4 =>
                    wave_20ns <= '1'; wave_40ns <= '1'; wave_80ns <= '0';
                when 5 =>
                    wave_20ns <= '0';
                when 6 =>
                    wave_20ns <= '1'; wave_40ns <= '0';
                when 7 =>
                    wave_20ns <= '0';
            end case;
        end if;
    end process;

end architecture Behavioral;