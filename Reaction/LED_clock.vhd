library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity LED_clock is
port(reset,clk,react,start,timer_in_rest: in std_logic ; countin: in unsigned (10 downto 0); LED_on, rest_indicator, early_press_indicator: out std_logic);
end entity LED_clock;
architecture Behave of LED_clock is 
signal  cnt  : unsigned (15 downto 0);
signal cnt2: unsigned (10 downto 0);
signal freeze_state, LED_sig, early_press_indicator_sig: std_logic;
constant c50K : unsigned (15 downto 0) := "1100001101010000";
constant c1k: unsigned (10 downto 0):="01111101000";
type RtlState is (rest, working);
signal rtl_state: RtlState;
begin
process(reset,clk, react, countin, start, freeze_state,timer_in_rest)
variable next_rtl_state: RtlState;
variable cnt_var:  unsigned (15 downto 0);
variable cnt2_var: unsigned (10 downto 0);
variable freeze_state_var, rest_indicator_var, early_press_indicator_var, LED_on_var: std_logic;

begin
next_rtl_state := rtl_state;
cnt_var := cnt;
cnt2_var:= cnt2;
freeze_state_var:= freeze_state;
early_press_indicator_var:=early_press_indicator_sig;
LED_on_var:=LED_sig;
rest_indicator_var:=rest_indicator_var;

case rtl_state is
        when rest=>
            cnt_var :="0000000000000000";
            cnt2_var:="00000000000";
            freeze_state_var := '0';
            LED_on_var :='0';
            if (start = '1') then
                freeze_state_var:= '0';
                rest_indicator_var:='0';
                early_press_indicator_var:='0';
                next_rtl_state := working;
            end if;


        when working=>
     
            if (timer_in_rest ='1') then
                rest_indicator_var := '1';
                next_rtl_state := rest;
            
            elsif(react = '1' and freeze_state= '1') then
                LED_on_var:='0';
                cnt_var:="0000000000000000";
                cnt2_var:="00000000000"; 
                freeze_state_var:= '0';

           -- elsif(rising_edge(react) and freeze_state = '0') then
             --   --Print game over (all 0s)
               -- early_press_indicator_var:='1';
                --rest_indicator_var:= '1';
                --next_rtl_state := rest;
             
            elsif (freeze_state = '0') then
            
                    if (cnt = c50K) then
                        cnt_var:="0000000000000000";
                        cnt2_var:=cnt2_var+1;
                    
                    elsif (cnt2 = (countin + c1k)) then
                        LED_on_var:= '1';
                        freeze_state_var:= '1';
                    else
                        cnt_var := cnt_var + 1;
                    end if;

            end if;   

end case;
-----rest state indicator from total_time_clock. Starts only when start pressed and starts counting. 


if (clk'event and (clk='1')) then
        if (reset = '1') then
                rtl_state <= rest;
                LED_on<='0';
        else
                rtl_state <= next_rtl_state;
                cnt<=cnt_var;
                cnt2<=cnt2_var;
                freeze_state<= freeze_state_var;
                early_press_indicator<=early_press_indicator_var;
                early_press_indicator_sig<=early_press_indicator_var;
                LED_on<=LED_on_var;
                LED_sig<=LED_on_var;
                rest_indicator<=rest_indicator_var;
        end if;
end if;
end process;

end architecture Behave;

