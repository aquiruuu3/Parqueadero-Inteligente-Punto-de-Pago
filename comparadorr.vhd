-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library  ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all; 

entity comparadorr is 
	port(inA, inB :in std_logic_vector(5 downto 0);
			mayor, igual, menor: out std_logic );
end comparadorr; 

architecture comportamiento of comparadorr is 
begin 
	
	mayor <= '1' when (inA > inB)
	else '0';
	menor <= '1' when (inA < inB)
	else '0';
	igual <= '1' when (inA = inB)
	else '0';
end comportamiento; 
	