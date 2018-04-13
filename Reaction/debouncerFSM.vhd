library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
entity slow_clock is
  port (x,y: in std_logic;
         z: out std_logic);
end entity slow_clock;

architecture Behave of slow_clock is
component DFF1 is
	port (D,RESET, CLK: in std_logic; Q: out std_logic);
 end component;	
signal q: std_logic_vector(18 downto 0);
signal invq: std_logic_vector(18 downto 0);
begin
  invq(0) <= not q(0);
  DFFa: DFF1 port map (D=>invq(0),CLK=>x,RESET=>y, Q=>q(0));
  invq(1) <= not q(1);
  DFFb: DFF1 port map (D=>invq(1),CLK=>q(0), RESET=>y, Q=>q(1));
  invq(2) <= not q(2);
  DFFc: DFF1 port map (D=>invq(2),CLK=>q(1), RESET=>y, Q=>q(2));
  invq(3) <= not q(3);
  DFFd: DFF1 port map (D=>invq(3),CLK=>q(2), RESET=>y, Q=>q(3));
   invq(4) <= not q(4);
  DFFe: DFF1 port map (D=>invq(4),CLK=>q(3), RESET=>y, Q=>q(4));
   invq(5) <= not q(5);
  DFFf: DFF1 port map (D=>invq(5),CLK=>q(4), RESET=>y, Q=>q(5));
   invq(6) <= not q(6);
  DFFg: DFF1 port map (D=>invq(6),CLK=>q(5), RESET=>y, Q=>q(6));
   invq(7) <= not q(7);
  DFFh: DFF1 port map (D=>invq(7),CLK=>q(6), RESET=>y, Q=>q(7));
   invq(8) <= not q(8);
  DFFi: DFF1 port map (D=>invq(8),CLK=>q(7), RESET=>y, Q=>q(8));
   invq(9) <= not q(9);
  DFFj: DFF1 port map (D=>invq(9),CLK=>q(8), RESET=>y, Q=>q(9));
   invq(10) <= not q(10);
  DFFk: DFF1 port map (D=>invq(10),CLK=>q(9), RESET=>y, Q=>q(10));
   invq(11) <= not q(11);
  DFFl: DFF1 port map (D=>invq(11),CLK=>q(10), RESET=>y, Q=>q(11));
   invq(12) <= not q(12);
  DFFm: DFF1 port map (D=>invq(12),CLK=>q(11), RESET=>y, Q=>q(12));
   invq(13) <= not q(13);
  DFFn: DFF1 port map (D=>invq(13),CLK=>q(12), RESET=>y, Q=>q(13));
   invq(14) <= not q(14);
  DFFo: DFF1 port map (D=>invq(14),CLK=>q(13), RESET=>y, Q=>q(14));
   invq(15) <= not q(15);
  DFFp: DFF1 port map (D=>invq(15),CLK=>q(14), RESET=>y, Q=>q(15));
   invq(16) <= not q(16);
  DFFq: DFF1 port map (D=>invq(16),CLK=>q(15), RESET=>y, Q=>q(16));
   invq(17) <= not q(17);
  DFFr: DFF1 port map (D=>invq(17),CLK=>q(16), RESET=>y, Q=>q(17));
   invq(18) <= not q(18);
  DFFs: DFF1 port map (D=>invq(18),CLK=>q(17), RESET=>y, Q=>z);
end Behave;

library ieee;
use ieee.std_logic_1164.all;
entity debouncerFSM is
port(x:in std_logic_vector(2 downto 0); z:out std_logic);
end entity;

architecture Behave of debouncerFSM is
component slow_clock is
  port (x,y: in std_logic;
         z: out std_logic);
end component slow_clock;
component DFF2 is
	port (D, CLK: in std_logic; Q: out std_logic);
 end component; 
signal invq0, invq1, invx, slowclockoutput, invr: std_logic;
signal q: std_logic_vector(1 downto 0);
signal nq: std_logic_vector( 1 downto 0);

begin


invx<= not(x(0));
invq0<=not(q(0));
invq1<=not(q(1));
invr<=not(x(2));

z<= (invr and (((invq1 and q(0) and x(0)) or (invq0 and q(1) and invx))));

nq(1)<= (invr and (((invq1 and q(0) and x(0)) or (invq0 and q(1) and invx))));

nq(0)<= (invr and(((invq1 and invq0 and x(0)) or (q(1) and invq0 and invx))));

clock1: slow_clock port map (x=>x(1), y=>x(2), z=>slowclockoutput);

DFFclock1: DFF2 port map ( D=>nq(1), CLK=>slowclockoutput, Q=>q(1));

DFFclock2: DFF2 port map ( D=>nq(0), CLK=>slowclockoutput, Q=>q(0));

end Behave;

