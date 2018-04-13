library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity Reaction is
port(reset,clk,react,start : in std_logic; LEDr,LEDs: out std_logic);
end entity Reaction;
architecture Behave of Reaction is 

component free_run_counter is
port(reset,clk,react, start : in std_logic; current_count: out unsigned(10 downto 0));
end component;

component LED_clock is
port(reset,clk,react,start,timer_in_rest: in std_logic ; countin: in unsigned (10 downto 0); LED_on, rest_indicator, early_press_indicator,LED_state: out std_logic);
end component;

component total_time_clock is
port(reset,clk,react, LED_on, start , LED_clock_in_rest, early_press_indicated: in std_logic;score: out unsigned (14 downto 0); rest_indicator: out std_logic);
end component total_time_clock;

component debouncerFSM is
port(x:in std_logic_vector(2 downto 0); z:out std_logic);
end component;

signal ir1,ir2, LED_indicator,early_press, react1,LED_state_sig: std_logic;
signal random_num: unsigned (10 downto 0);

begin 

x_1: debouncerFSM port map (x(0)=> not(react), x(1)=> clk, x(2)=>not(reset), z=>react1);

x_2: free_run_counter port map(reset=>not(reset), clk=>clk, react=>react1, start=>not(start), current_count=> random_num);

x_3: LED_clock port	map (reset=>not(reset), clk=>clk, react=>react1, start=>not(start), timer_in_rest=>ir1, countin=> random_num, LED_on=>LED_indicator, rest_indicator=>ir2, early_press_indicator=>early_press,LED_state=>LED_state_sig);

LEDr <= LED_indicator;
LEDs <=LED_state_sig;
x_4: total_time_clock port map (reset=>not(reset), react=>react1, LED_on => LED_indicator, start=>not(start) , clk=>clk, LED_clock_in_rest=>ir2, early_press_indicated=> early_press, rest_indicator => ir1 );

end Behave;