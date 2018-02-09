library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
entity fullbitadder is
port(a, b, cin: in std_logic;
         sum, cout: out std_logic);
end entity fullbitadder;
architecture Behave of fullbitadder is
begin
  sum <= ((a xor b) xor(cin));
  cout <= ((a and b) or ((a xor b) and cin));
  
end Behave;

library ieee;
use ieee.std_logic_1164.all;

entity eightbitadder is
port(x,y:in std_logic_vector(7 downto 0); z:out std_logic_vector(7 downto 0));

end entity eightbitadder;
architecture Behave of eightbitadder is
component fullbitadder is
	port(a, b, cin: in std_logic;
         sum, cout: out std_logic);
			end component;
 signal cout: std_logic_vector(7 downto 0);
begin

x_1 : fullbitadder port map (a=>x(0) , b=>y(0), cin=>'0', sum => z(0), cout=> cout(0)) ;

x_2 : fullbitadder port map (a=>x(1) , b=>y(1), cin=>cout(0), sum => z(1), cout=> cout(1)) ;

x_3 : fullbitadder port map (a=>x(2) , b=>y(2), cin=>cout(1), sum => z(2), cout=> cout(2)) ;

x_4 : fullbitadder port map (a=>x(3) , b=>y(3), cin=>cout(2), sum => z(3), cout=> cout(3)) ;

x_5 : fullbitadder port map (a=>x(4) , b=>y(4), cin=>cout(3), sum => z(4), cout=> cout(4)) ;

x_6 : fullbitadder port map (a=>x(5) , b=>y(5), cin=>cout(4), sum => z(5), cout=> cout(5)) ;

x_7 : fullbitadder port map (a=>x(6) , b=>y(6), cin=>cout(5), sum => z(6), cout=> cout(6)) ;

x_8 : fullbitadder port map (a=>x(7) , b=>y(7), cin=>cout(6), sum => z(7), cout=> cout(7)) ;

  
end architecture Behave;