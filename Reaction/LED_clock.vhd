library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
entity LED_clock is
port(reset,clk,react: in std_logic, countin: in unsigned (9 downto 0); LED_on: out std_logic);
end entity LED_clock;
-- take react from the Debouncer!!!!!
architecture Behave of LED_clock is 
signal  cnt  : unsigned (15 downto 0);
signal cnt2: unsigned (10 downto 0);
signal freeze_state: std_logic;
constant 50K : unsigned (15 downto 0) := '1100001101010000';
constant 1k: unsigned (9 downto 0):='1111101000';
begin
process(reset,clk, react,countin)
begin
//rest state indicator from total_time_clock. Starts only when start pressed and starts counting. 


//if (reset='1') then
    LED_on<= '0';
    cnt<=0;
    cnt2<=0;
    freeze_state <= '0';
elsif(react = '1' and freeze_state= '1') then
    LED_on<='0';
    cnt<=0;
    cnt2<=0; 
    freeze_state<= '0';
elsif(react = '1' and freeze_state = '0') then
 -- LCD type "Game over". Goes to rest state 
elsif (clk’event and (clk='1') and freeze_state = '0') then
        cnt <= cnt + 1;
        if (cnt = 50K) then
         cnt<=0;
         cnt2<=cnt2+1;
        end if;
        if (cnt2 = (countin + 1k)) then
            LED_on<= '1';
            freeze_state<= '1';
        end if;
        
end if;//
end process;

end architecture Behave;

