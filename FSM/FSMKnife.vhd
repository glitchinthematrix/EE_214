library std;
use std.standard.all;



library ieee;
use ieee.std_logic_1164.all;


entity FSMKnife is
  port(x: in std_ulogic_vector(6 downto 0);
    z: out std_ulogic);
end entity;

architecture behave of FSMKnife is
 component DFF1 is
  port (D, CLK: in std_logic; Q: out std_logic);
 end component;   

 component AND_5 is
 port (a, b, c, d, e: in std_logic;
         outp: out std_logic);
  end component;       
 signal inv4, inv3, inv2, inv1, inv0, invr, isk, isn, isi, isf, ise: std_logic;
 signal q: std_ulogic_vector(2 downto 0);
 signal nq: std_ulogic_vector( 2 downto 0);
 begin

 inv4<= not(x(4));

 inv1<= not(x(1));

 inv2<= not(x(2));

 inv3<= not(x(3));
 
 inv0<= not(x(0));
 
 invr<= not(x(6));

 iskFSM: AND_5 port map( a=>inv4, b=>x(3), c=>inv2, d=>x(1), e=>x(0), outp=>isk);

 isnFSM: AND_5 port map( a=>inv4, b=>x(3), c=>x(2), d=>x(1), e=>inv0, outp=>isn);

 isiFSM: AND_5 port map (a=>inv4, b=>x(3), c=>inv2, d=>inv1, e=>x(0), outp=>isi);

 isfFSM: AND_5 port map (a=>inv4, b=>inv3, c=>x(2), d=>x(1), e=>inv0, outp=>isf);

 iseFSM: AND_5 port map (a=>inv4, b=>inv3, c=>x(2), d=>inv1, e=>x(0), outp=>ise);


 z<= (invr and ise and q(2) and not(q(1)) and not(q(0)));

 nq(2)<= ((invr and isf and not(x(2)) and x(1) and x(0)) or (invr and not(ise) and  q(2) and not(q(1)) and not(q(0))));

 nq(1)<= ((invr and not(x(2)) and x(1) and not(x(0))) or (invr and not(isf) and not(x(2)) and x(1) and x(0) ));

 nq(0)<=((invr and isk and not(q(0)) and not(q(1)) and not(q(2))) or (invr and not(isn) and q(0) and not(q(1)) and not(q(2))) or ( invr and not(x(2)) and x(1) and not(x(0)) and isi) or (invr and not(isf) and not(x(2)) and x(1) and x(0) ) );

 DFFclock1: DFF1 port map ( D=>nq(1), CLK=>x(5), Q=>q(1));

 DFFclock2: DFF1 port map ( D=>nq(0), CLK=>x(5), Q=>q(0));


end Behave;
