-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  two-bit adder.
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_ulogic_vector(6 downto 0); 
       	output_vector: out std_ulogic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
	
	component StringrecFSM is 
	port( X : in std_ulogic_vector(6 downto 0); Z : out std_logic);
end component;
	

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
dut: StringrecFSM port map ( X =>input_vector , Z=>output_vector(0) );

end DutWrap;

