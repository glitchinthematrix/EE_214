library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
entity total_time_clock is
port(reset,clk,react, LED_on : in std_logic; score: out unsigned (14 downto 0));
end entity total_time_clock;
architecture Behave of total_time_clock is 
signal cnt   : unsigned (15 downto 0);
signal cnt2: unsigned (10 downto 0);
signal count : unsigned (15 downto 0);
signal score_intermediate: unsigned (14 downto 0);
signal start_count: std_logic;
constant 50K : unsigned (15 downto 0) := '1100001101010000';
constant 2k: unsigned (10 downto 0):='11111010000';
begin
process(reset,clk,react,LED_on)
begin
if (reset='1') then
        cnt<='0';
        cnt2<='0';
        start_count<='0';
elsif (LED_on = '1' and start_count = '0') then
        start_count <= '1';
elsif(react = '1') then
	count<= count +1;
        score_intermediate<= score + cnt2;
        cnt<=0;
        cnt2<=0;
        start_count<='0';
elsif (clk’event and (clk='1') and start_count = '1') then
        cnt<=cnt+1;
        if (cnt = 50K) then
         cnt<=0;
         cnt2<=cnt2+1;
        end if;
        if (cnt2 >=2k) then
         \\gameoverbsdk
        end if;
end if;
if(count = 8) then
\\gameover
\\finalscoreon LCD

        endif
end process;

end architecture Behave;