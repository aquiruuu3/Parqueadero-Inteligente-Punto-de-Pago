-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_signed.all;
entity sumador_acumulador is 
	port(x: in std_logic_vector(6 downto 0);
	     y: in std_logic_vector(6 downto 0);
	      s: out std_logic_vector(6 downto 0));
end sumador_acumulador;
architecture comportamiento of sumador_acumulador is 
begin 
	s <= x+ y;
end comportamiento; 