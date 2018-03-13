library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

package EE224_Components is
   component INVERTER is
	port (a: in std_logic; b : out std_logic);
   end component;
   component AND_2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
   component OR_2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
   component NAND_2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
   component XOR_2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
end EE224_Components;

library ieee;
use ieee.std_logic_1164.all;
entity INVERTER is
  port (a: in std_logic;
         b: out std_logic);
end entity INVERTER;
architecture Behave of INVERTER is
begin
  b <= not a;
end Behave;

library ieee;
use ieee.std_logic_1164.all;
entity AND_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity AND_2;
architecture Behave of AND_2 is
begin
  c <= a and b;
end Behave;

library ieee;
use ieee.std_logic_1164.all;
entity OR_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity OR_2;
architecture Behave of OR_2 is
begin
  c <= a or b;
end Behave;

library ieee;
use ieee.std_logic_1164.all;
entity NAND_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity NAND_2;
architecture Behave of NAND_2 is
begin
  c <= not (a and b);
end Behave;

library ieee;
use ieee.std_logic_1164.all;
entity XOR_2 is
  port (a, b: in std_logic;
         c: out std_logic);
end entity XOR_2;
architecture Behave of XOR_2 is
begin
  c <= (a xor b);
end Behave;


library ieee;
use ieee.std_logic_1164.all;

library work;
-- package of component declarations..
use work.EE224_Components.all;

entity fullbitadder is
port(a, b, cin: in std_logic;
         sum, cout: out std_logic);
end entity fullbitadder;
architecture Behave of fullbitadder is
signal w, p,g : std_logic;
begin
  x_1: XOR_2 port map (a=> a, b=> b, c=>w);
  x_2: XOR_2 port map( a=> w, b=> cin, c=>sum);
  x_3: AND_2 port map (a=>a , b=>b, c=>p);
  x_4: AND_2 port map (a=>w,b=>cin,c=>g);
  x_5: OR_2 port map (a=>p, b=>g, c=>cout);
  
end Behave;


library ieee;
-- std_logic type and associated functions.
use ieee.std_logic_1164.all;

entity counter is
port( x: in std_logic_vector(3 downto 0); b:in std_logic; z: out std_logic_vector ( 3 downto 0));
end entity counter;

architecture Struct of counter is
component fullbitadder is 
 port (a, b, cin: in std_logic;
         sum, cout: out std_logic);
      end component;
signal cout: std_logic_vector(3 downto 0);

begin
x_1 : fullbitadder port map (a=>x(0) , b=>b, cin=>'0', sum => z(0), cout=> cout(0)) ;

x_2 : fullbitadder port map (a=>x(1) , b=>'0', cin=>cout(0), sum => z(1), cout=> cout(1)) ;

x_3 : fullbitadder port map (a=>x(2) , b=>'0', cin=>cout(1), sum => z(2), cout=> cout(2)) ;

x_4 : fullbitadder port map (a=>x(3) , b=>'0', cin=>cout(2), sum => z(3), cout=> cout(3)) ;

end architecture Struct;



