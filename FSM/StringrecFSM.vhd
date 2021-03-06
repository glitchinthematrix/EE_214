library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity StringrecFSM is
	port(X: in std_ulogic_vector(6 downto 0);
    Z: out std_ulogic);
   end entity;
  architecture Behave of StringrecFSM is

component FSMGun is
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end component;

component FSMBomb is
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end component;

component FSMKnife is
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end component;

component FSMTerror is
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end component;

signal z1, z2, z3, z4: std_logic;

begin

FSM1: FSMGun port map ( x=>X, z=>z1);

FSM2: FSMBomb port map ( x=>X, z=>z2);

FSM3: FSMTerror port map ( x=>X, z=>z3);

FSM4: FSMKnife port map ( x=>X, z=>z4);

Z<= (z1 or z2 or z3 or z4);

end Behave;






