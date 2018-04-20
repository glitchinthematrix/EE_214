-- USE CLOCK BETWEEN 100 HZ TO 10K

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
entity final_test1 is
port (clk    : in std_logic;                          --use clock between 100hz to 10khz 
      rst    : in std_logic;	--reset
      lcd_rw : out std_logic;                         --read & write control
      lcd_en : out std_logic;                         --enable control
      lcd_rs : out std_logic;                         --data or command control
      lcd1  : out std_logic_vector(7 downto 0);		 --see pin planning in krypton manual 
      score: in unsigned (15 downto 0);
		b11 : out std_logic;
		b12 : out std_logic);     --data line
end final_test1;

architecture behave of final_test1 is 



component lcd_controller is
port ( clk    : in std_logic;                          --clock i/p
       rst    : in std_logic;                          -- reset
	   erase : in std_logic;                  --- clear position
	   put_char : in std_logic;
	   write_data : in std_logic_vector(7 downto 0) ;
		write_row : in std_logic_vector(0 downto 0);
		write_column : in std_logic_vector(3 downto 0);
	   ack : out std_logic;
      lcd_rw : out std_logic;                         --read & write control
      lcd_en : out std_logic;                         --enable control
      lcd_rs : out std_logic;                         --data or command control
      lcd1  : out std_logic_vector(7 downto 0);
		b11 : out std_logic;
		b12 : out std_logic);     --data line
end component lcd_controller;
 
signal erase : std_logic := '0';                  --- clear position
signal put_char :  std_logic := '1';
signal write_data :  std_logic_vector(7 downto 0) ;
signal 	write_row : std_logic_vector( 0 downto 0) := "0";

signal s1,s11 : std_logic_vector ( 3 downto 0) := "0000"; -- S1 IS WRITE_COLUMN
signal i,j : integer := 0; 
signal ack,o2: std_logic;

type RtlState is (s01, s2, s3, s4);
signal rtl_state: RtlState;

function hex2char ( hex : std_logic_vector(3 downto 0) ) return std_logic_vector is
		variable char : std_logic_vector(7 downto 0) := x"20";
	begin
		case hex is
			when x"0" => char := x"30";
			when x"1" => char := x"31";
			when x"2" => char := x"32";
			when x"3" => char := x"33";
			when x"4" => char := x"34";
			when x"5" => char := x"35";
			when x"6" => char := x"36";
			when x"7" => char := x"37";
			when x"8" => char := x"38";
			when x"9" => char := x"39";
			when x"a" => char := x"61";
			when x"b" => char := x"62";
			when x"c" => char := x"63";
			when x"d" => char := x"64";
			when x"e" => char := x"65";
			when x"f" => char := x"66";
			when others => char := x"3f";
		end case;
		return char;
	end hex2char;


begin
-- HOW TO USE LCD CONTROLLER MODULE
lcd_instance1 : lcd_controller port map (
					clk => clk, rst => rst, erase => erase , put_char => put_char , write_data =>write_data , write_row => write_row,
					write_column => s1 , ack => ack, lcd_rw => lcd_rw, lcd_en => lcd_en, lcd_rs => lcd_rs,
					lcd1 => lcd1, b11 => b11, b12 => b12);	
					

process(ack,rst,clk,rtl_state)
variable next_rtl_state: RtlState;
variable write_data_var : std_logic_vector(7 downto 0);
variable write_row_var: std_logic_vector( 0 downto 0);
variable s1_var : std_logic_vector ( 3 downto 0);
variable  erase_var, put_char_var: std_logic;
begin
case rtl_state is
 when s01 =>
if(ack = '1') then
	write_data_var := hex2char(std_logic_vector(score(3 downto 0)));
	s1_var := "0000" ;
	write_row_var:= "0";
	put_char_var:='1';
	next_rtl_state:= s2;
end if;
when s2=>
	if(ack = '1') then
	write_data_var := hex2char(std_logic_vector(score(7 downto 4)));
	s1_var := "0001";
	write_row_var:= "0";
	put_char_var:='1';
	next_rtl_state:= s3;
	end if;
when s3=>
	if(ack = '1') then
	write_data_var := hex2char(std_logic_vector(score(11 downto 8)));
	s1_var := "0010";
	write_row_var:= "0";
	put_char_var:='1';
	next_rtl_state:= s4;
	end if;
when s4=>
	if(ack = '1') then
	write_data_var := hex2char(std_logic_vector(score(15 downto 12)));
	s1_var := "0011";
	write_row_var:= "0";
	put_char_var:='1';
	next_rtl_state:= s01;
end if;

end case;
if (rising_edge(clk)) then
if (rst = '1') then
	rtl_state <= s01;
	erase<='0';	
 else 
	rtl_state<=next_rtl_state;
	write_data<=write_data_var;
	write_row<= write_row_var;
	s1<=s1_var;
	put_char<= put_char_var;
end if;
end if;

end process;



end architecture;