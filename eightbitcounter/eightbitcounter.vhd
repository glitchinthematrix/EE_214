library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity eightbitcounter is
port( a: in std_logic_vector(7 downto 0);  z: out std_logic_vector ( 3 downto 0));
end entity eightbitcounter;

architecture Behave of eightbitcounter is

component counter is 
port( x: in std_logic_vector(3 downto 0); b:in std_logic; z: out std_logic_vector ( 3 downto 0));
	end component;

signal t1, t2, t3, t4, t5, t6, t7: std_logic_vector(3 downto 0);

begin

x_1: counter port map ( x=>"0000", b=>a(0), z=>t1);

x_2: counter port map ( x=>t1, b=>a(1), z=>t2);

x_3: counter port map ( x=>t2, b=>a(2), z=>t3);

x_4: counter port map ( x=>t3, b=>a(3), z=>t4);

x_5: counter port map ( x=>t4, b=>a(4), z=>t5);

x_6: counter port map ( x=>t5, b=>a(5), z=>t6);

x_7: counter port map ( x=>t6, b=>a(6), z=>t7);

x_8: counter port map ( x=>t7, b=>a(7), z=>z);

end architecture Behave;