library std;
use std.standard.all;


entity LED_clock is
port(reset,clk,react: in std_logic, countin: in integer; LED_on: out std_logic);
end entity LED_clock;
-- take react from the Debouncer!!!!!
architecture Behave of LED_clock is 
begin
process(reset,clk, react,countin)
variable  cnt  : integer;
variable cnt2: integer;
variable countin1: integer;
variable freeze_state: std_logic;
begin
countin1 := 1000 + countin;
if (reset='1') then
    LED_on<= '0';
    cnt:=0;
    cnt2:=0;
    freeze_state := '0';
elsif(react1 = '1') then
    LED_on<='0';
    cnt:=0;
    cnt2:=0; 
    freeze_state:= '0';
elsif(react = '1' and freeze_state = '0') then
 -- LCD type "Game over". Goes to rest state 
elsif (clk’event and (clk=’1’) and freeze_state = '0') then
        cnt := cnt + 1;
        if (cnt = 50000) then
         cnt:=0;
         cnt2:=cnt2+1;
        end if;
        if (cnt2 = countin1) then
            LED_on<= '1';
            freeze_state:= '1';
        end if;
        
end if;
end process;

end architecture Behave;

