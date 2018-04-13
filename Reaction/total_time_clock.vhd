library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity total_time_clock is
port(reset,clk,react, LED_on, start , LED_clock_in_rest, early_press_indicated: in std_logic;score: out unsigned (14 downto 0); rest_indicator: out std_logic);
end entity total_time_clock;
architecture Behave of total_time_clock is 

type RtlState is (rest, working);
signal cnt   : unsigned (15 downto 0);
signal cnt2: unsigned (10 downto 0);
signal count : unsigned (3 downto 0);
signal score_intermediate: unsigned (14 downto 0);
signal start_count: std_logic;
signal rtl_state: RtlState;
constant c50K : unsigned (15 downto 0) := "1100001101010000";
constant c2k: unsigned (10 downto 0):="11111010000";
begin
process(reset,clk,react,LED_on,rtl_state, start_count,LED_clock_in_rest,early_press_indicated,count)
variable next_rtl_state: RtlState;
variable cnt_var : unsigned (15 downto 0);
variable cnt2_var :  unsigned (10 downto 0);
variable count_var: unsigned (3 downto 0);
variable score_intermediate_var: unsigned (14 downto 0);
variable start_count_var, rest_indicator_var: std_logic;        
begin
next_rtl_state:= rtl_state;
score_intermediate_var:=score_intermediate;
count_var := count;
cnt_var:= cnt;
cnt2_var:= cnt2;

case rtl_state is
        when rest =>
                 cnt_var:="0000000000000000";
                 cnt2_var:="00000000000";
                score_intermediate_var :="000000000000000";
                if (start = '1') then
                rest_indicator_var:='0';
                next_rtl_state := working;
						end if;
        when working =>
                if ( LED_clock_in_rest='1') then
                        rest_indicator_var:= '1';
                        next_rtl_state := rest;
                end if;

                if (LED_on = '1' and start_count = '0') then
                        start_count_var := '1';
                elsif(react = '1') then
                        count_var := count_var +1;
                        score_intermediate_var:= score_intermediate_var+ cnt2;
                        cnt_var:="0000000000000000";
                        cnt2_var:="00000000000";
                        start_count_var:='0';
                elsif (cnt = c50K) then
                     cnt_var:="0000000000000000";
                        cnt2_var:=cnt2_var+1;   
                elsif (count = "1000") then
                        rest_indicator_var:='1';
                        next_rtl_state := rest;
                elsif (early_press_indicated = '1') then
                        score_intermediate_var:= "000000000000000";
                elsif (cnt2 >=c2k) then
                        score_intermediate_var:= "000000000000000";
                        rest_indicator_var:='1';
                        next_rtl_state := rest;
                else
                        cnt_var:=cnt_var+1;
                 end if;
            
end case;

if (clk'event and clk='1') then
        if (reset = '1') then
                count<="0000";
                score_intermediate<="000000000000000";
		score<="000000000000000";
                 rtl_state <= rest;
        else
                rtl_state <= next_rtl_state;
                cnt<=cnt_var;
                cnt2<=cnt2_var;
                count<=count_var;
                score_intermediate<=score_intermediate_var;
                start_count<=start_count_var;
                rest_indicator<=rest_indicator_var;
        
		  if (rtl_state = working and count = "1000") then
		      score<=score_intermediate_var;
		  end if;
		  end if;
end if;		  
end process;

end architecture Behave;