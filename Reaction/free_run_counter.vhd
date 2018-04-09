library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
entity free_run_clock is
port(reset,clk,react : in std_logic; current_count: out unsigned (9 downto 0);
end entity free_run_clock;
architecture Behave of free_run_clock is 
signal cnt: unsigned (15 downto 0);
signal cnt2: unsigned (9 downto 0);
constant 50K : unsigned (15 downto 0) := '1100001101010000';
constant 1k: unsigned (9 downto 0):='1111101000';
begin
process(reset,clk,react)
begin
if (reset='1') then
        cnt<=0;
        cnt2<=0;
elsif(react = '1') then
	current_count<= cnt2;
elsif (clk’event and (clk='1')) then
        cnt<=cnt+1;
        if (cnt = 50K) then
         cnt<=0;
         cnt2<=cnt2+1;
        end if;
        if (cnt2 = 1k) then
         cnt2<=0;
         end if;
end if;
end process;

end architecture Behave;

