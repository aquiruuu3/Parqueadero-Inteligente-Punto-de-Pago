-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library ieee;
use ieee.std_logic_1164.all;

entity codPrior is
	PORT(m : IN std_logic_vector(3 downto 0);
		c: OUT std_logic_vector(1 downto 0));
		
end codPrior;

architecture solPackCOD of codPrior is
begin
	c <= "11" when m(0) = '1' else -- TARJETA D
		  "10" when m(1) = '1' else -- TARJETA C
		  "01" when m(2) = '1' else -- TARJETA B
		  "00" when m(3) = '1'; -- TARJETA A
end solPackCOD;