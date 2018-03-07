library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;
entity AND_5 is
  port (a, b, c, d, e: in std_logic;
         outp: out std_logic);
end entity AND_5;
architecture Behave of AND_5 is
begin
  outp<= ((((a and b) and c )and d )and e) ;
end Behave;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

entity FSMBomb is
  port(x: in std_ulogic_vector(6 downto 0);
    z: out std_ulogic);
end entity;

architecture behave of FSMBomb is
 component DFF1 is
  port (D, CLK: in std_logic; Q: out std_logic);
 end component;   

 component AND_5 is
 port (a, b, c, d, e: in std_logic;
         outp: out std_logic);
  end component;       
 signal inv4, inv3, inv2, inv1, inv0, invr, isb, iso, ism: std_logic;
 signal q: std_ulogic_vector(1 downto 0);
 signal nq: std_ulogic_vector( 1 downto 0);
 begin

 inv4<= not(x(4));

 inv1<= not(x(1));

 inv2<= not(x(2));

 inv3<= not(x(3));
 
 inv0<= not(x(0));
 
 invr<= not(x(6));

 isbFSM: AND_5 port map( a=>inv4, b=>inv3, c=>inv2, d=>x(1), e=>inv0, outp=>isb);

 isoFSM: AND_5 port map( a=>inv4, b=>x(3), c=>x(2), d=>inv1, e=>x(0), outp=>iso);

 ismFSM: AND_5 port map (a=>inv4, b=>x(3), c=>x(2), d=>x(1), e=>x(0), outp=>ism);

 z<= (invr and isb and q(1) and q(0) );

 nq(1)<= ((invr and q(1) and not(q(0))) or ( invr and not(isb) and q(1) and q(0) ) or (invr and iso and not(q(1)) and q(0)));

 nq(0)<=((invr and q(1) and not(q(0)) and ism) or ( invr and not(isb) and q(1) and q(0)) or (invr and isb and not(q(1)) and not(q(0))) or (invr and not(iso) and 
 not(q(1)) and q(0)));

 DFFclock1: DFF1 port map ( D=>nq(1), CLK=>x(5), Q=>q(1));

 DFFclock2: DFF1 port map ( D=>nq(0), CLK=>x(5), Q=>q(0));


end Behave;
