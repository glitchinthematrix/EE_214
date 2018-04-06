library std;
use std.standard.all;


entity total_time_clock is
port(reset,clk,react, LED_on : in std_logic; score: out integer);
end entity total_time_clock;
architecture Behave of total_time_clock is 
begin
process(reset,clk,react,LED_on)
variable cnt   : integer;
variable cnt2: integer;
variable count : integer;
variable score: integer;
variable start_count: std_logic;
begin
score:=0;
count:=0;
start_count: '0' ;
if (reset='1') then
        cnt:=0;
        cnt2:=0;
elsif (LED_on = '1' and start_count = '0') then
        start_count : = '1';
elsif(react = '1') then
        cnt:=0;
        cnt2:=0;
	count:= count +1;
        score:= score + cnt2
elsif (clk’event and (clk=’1’) and start_count = '1') then
        cnt:=cnt+1;
        if (cnt = 50,000) then
         cnt:=0;
         cnt2:=cnt2+1;
        end if;
        if (cnt2 = 1000) then
         cnt2:=0;
         end if;
end if;
end process;

end architecture Behave;