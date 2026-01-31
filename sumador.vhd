-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_signed.all;
entity sumador is 
	port(x,y: in std_logic_vector(5 downto 0);
	      s: out std_logic_vector(5 downto 0));
end sumador;
architecture comportamiento of sumador is 
begin 
	s <= x+y;
end comportamiento; 