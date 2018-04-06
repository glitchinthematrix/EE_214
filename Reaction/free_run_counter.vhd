library std;
use std.standard.all;


entity free_run_clock is
port(reset,clk,react : in std_logic; current_count: out integer);
end entity free_run_clock;
architecture Behave of free_run_clock is 
begin
process(reset,clk,react)
variable   cnt   : integer;
variable cnt2: integer;
begin
if (reset='1') then
        cnt:=0;
        cnt2:=0;
elsif(react = '1') then
	current_count<= cnt2;
elsif (clk’event and (clk=’1’)) then
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

