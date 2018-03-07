library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;


entity FSMGun is
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end entity;

architecture behave of FSMGun is
 component DFF1 is
	port (D, CLK: in std_logic; Q: out std_logic);
 end component;		

 component AND_5 is
 port (a, b, c, d, e: in std_logic;
         outp: out std_logic);
  end component;       
 signal inv4, inv3, inv2, inv1, inv0, invr, isn, isu, isg: std_logic;
 signal q: std_ulogic_vector(1 downto 0);
 signal nq: std_ulogic_vector( 1 downto 0);
 begin

 inv4<= not(x(4));

 inv1<= not(x(1));

 inv2<= not(x(2));

 inv3<= not(x(3));
 
 inv0<= not(x(0));
 
 invr<= not(x(6));

 isgFSM: AND_5 port map( a=>inv4, b=>inv3, c=>x(2), d=>x(1), e=>x(0), outp=>isg);

 isuFSM: AND_5 port map( a=>x(4), b=>inv3, c=>x(2), d=>inv1, e=>x(0), outp=>isu);

 isnFSM: AND_5 port map (a=>inv4, b=>x(3), c=>x(2), d=>x(1), e=>inv0, outp=>isn);

 z<= (invr and isn and q(1) and not(q(0)));

 nq(1)<=((invr and not(isn) and q(1) and not(q(0))) or ((invr) and isu and not(q(1)) and q(0)));

 nq(0)<=((invr and isg and not(q(1)) and not(q(0))) or (not(isu) and invr and not(q(1)) and q(0))) ;

 DFFclock1: DFF1 port map ( D=>nq(1), CLK=>x(5), Q=>q(1));

 DFFclock2: DFF1 port map ( D=>nq(0), CLK=>x(5), Q=>q(0));


end Behave;














