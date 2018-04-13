library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity free_run_counter is
port(reset,clk,react, start : in std_logic; current_count: out unsigned(10 downto 0));
end entity free_run_counter;
architecture Behave of free_run_counter is 
signal cnt: unsigned (15 downto 0);
signal cnt2: unsigned (10 downto 0);
constant c50K : unsigned (15 downto 0) := "1100001101010000";
constant c1k: unsigned (10 downto 0):="01111101000";
begin
process(reset,clk,react,start)
begin

if (clk'event and (clk='1')) then
		if (reset='1') then
        cnt<= "0000000000000000";
        cnt2<="00000000000";

		
		else 
		 
		 if(react = '1' or start = '1') then
			current_count<= cnt2;
	
        elsif (cnt = c50K) then
         cnt<="0000000000000000";
         cnt2<=cnt2+1;
       
        elsif (cnt2 = c1k) then
         cnt2<="00000000000";
         else 
          cnt<=cnt+1;
        end if;
        end if;
end if;
end process;

end architecture Behave;

