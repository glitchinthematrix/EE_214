library std;
use std.standard.all;


library ieee;
use ieee.std_logic_1164.all;
entity decisionmuxs1 is
port(a: in std_logic_vector( 7 downto 0); b:in std_logic;
         shift: out std_logic_vector( 7 downto 0));
end entity decisionmuxs1;
architecture Behave of decisionmuxs1 is
begin 
	shift(7) <= (('0' and b) or ( not(b) and a(7)));
	shift(6) <= ((a(7) and b) or ( not(b) and a(6)));
	shift(5) <= ((a(6) and b) or ( not(b) and a(5)));
	shift(4) <= ((a(5) and b) or ( not(b) and a(4)));
	shift(3) <= ((a(4) and b) or ( not(b) and a(3)));
	shift(2) <= ((a(3) and b) or ( not(b) and a(2)));
	shift(1) <= ((a(2) and b) or ( not(b) and a(1)));
	shift(0) <= ((a(1) and b) or ( not(b) and a(0)));
end Behave;


library ieee;
use ieee.std_logic_1164.all;
entity decisionmuxs2 is
port(a: in std_logic_vector( 7 downto 0); b:in std_logic;
         shift: out std_logic_vector( 7 downto 0));
end entity decisionmuxs2;
architecture Behave of decisionmuxs2 is
begin 
	shift(7) <= (('0' and b) or ( not(b) and a(7)));
	shift(6) <= (('0' and b) or ( not(b) and a(6)));
	shift(5) <= ((a(7) and b) or ( not(b) and a(5)));
	shift(4) <= ((a(6) and b) or ( not(b) and a(4)));
	shift(3) <= ((a(5) and b) or ( not(b) and a(3)));
	shift(2) <= ((a(4) and b) or ( not(b) and a(2)));
	shift(1) <= ((a(3) and b) or ( not(b) and a(1)));
	shift(0) <= ((a(2) and b) or ( not(b) and a(0)));
end Behave;	


library ieee;
use ieee.std_logic_1164.all;
entity decisionmuxs3 is
port(a: in std_logic_vector( 7 downto 0); b:in std_logic;
         shift: out std_logic_vector( 7 downto 0));
end entity decisionmuxs3;
architecture Behave of decisionmuxs3 is
begin 
	shift(7) <= (('0' and b) or ( not(b) and a(7)));
	shift(6) <= (('0' and b) or ( not(b) and a(6)));
	shift(5) <= (('0' and b) or ( not(b) and a(5)));
	shift(4) <= (('0' and b) or ( not(b) and a(4)));
	shift(3) <= ((a(7) and b) or ( not(b) and a(3)));
	shift(2) <= ((a(6) and b) or ( not(b) and a(2)));
	shift(1) <= ((a(5) and b) or ( not(b) and a(1)));
	shift(0) <= ((a(4) and b) or ( not(b) and a(0)));
end Behave	;

library ieee;
use ieee.std_logic_1164.all;
entity decisionmuxs4 is
port(a: in std_logic_vector( 7 downto 0); b:in std_logic;
         shift: out std_logic_vector( 7 downto 0));
end entity decisionmuxs4;
architecture Behave of decisionmuxs4 is
begin 
	shift(7) <= (('0' and b) or ( not(b) and a(7)));
	shift(6) <= (('0' and b) or ( not(b) and a(6)));
	shift(5) <= (('0' and b) or ( not(b) and a(5)));
	shift(4) <= (('0' and b) or ( not(b) and a(4)));
	shift(3) <= (('0' and b) or ( not(b) and a(3)));
	shift(2) <= (('0' and b) or ( not(b) and a(2)));
	shift(1) <= (('0' and b) or ( not(b) and a(1)));
	shift(0) <= (('0' and b) or ( not(b) and a(0)));
end Behave	;
  
library ieee;
use ieee.std_logic_1164.all;  
  
entity eightbitrightshifter is
	port(ain:in std_logic_vector(7 downto 0); bin:in std_logic_vector(7 downto 0); z:out std_logic_vector(7 downto 0));
end entity eightbitrightshifter;
architecture Behave of eightbitrightshifter is
component decisionmuxs1 is
	port(a: in std_logic_vector( 7 downto 0); b:in std_logic;
         shift: out std_logic_vector( 7 downto 0));
	end component decisionmuxs1;
component decisionmuxs2 is
	port(a: in std_logic_vector( 7 downto 0); b:in std_logic;
         shift: out std_logic_vector( 7 downto 0));
end component decisionmuxs2;
component decisionmuxs3 is
	port(a: in std_logic_vector( 7 downto 0); b:in std_logic;
         shift: out std_logic_vector( 7 downto 0));
end component decisionmuxs3;
component decisionmuxs4 is
	port(a: in std_logic_vector( 7 downto 0); b:in std_logic;
         shift: out std_logic_vector( 7 downto 0));
end component decisionmuxs4;
signal firstoutput,secondoutput,thirdoutput, fourthoutput,fifthoutput, sixthoutput,seventhoutput: std_logic_vector( 7 downto 0);
begin
		x_1 : decisionmuxs1 port map ( a=> ain, b=>bin(0), shift=>firstoutput);
		x_2 : decisionmuxs2 port map ( a=> firstoutput, b=>bin(1), shift=>secondoutput);
		x_3 : decisionmuxs3 port map ( a=> secondoutput, b=>bin(2), shift=>thirdoutput);
		x_4 : decisionmuxs4 port map ( a=> thirdoutput, b=>bin(3), shift=>fourthoutput);
		x_5 : decisionmuxs4 port map ( a=> fourthoutput, b=>bin(4), shift=>fifthoutput);
		x_6 : decisionmuxs4 port map ( a=> fifthoutput, b=>bin(5), shift=>sixthoutput);
		x_7 : decisionmuxs4 port map ( a=> sixthoutput, b=>bin(6), shift=>seventhoutput);
		x_8 : decisionmuxs4 port map ( a=> seventhoutput, b=>bin(7), shift=>z);

	
end architecture Behave;


