-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library ieee; 
use ieee.std_logic_1164.all;

entity mux2a1 is
	port( x,y: in std_logic_vector(5 downto 0);
			sel: in std_logic;
			K:out std_logic_vector(5 downto 0));
end mux2a1 ;
architecture sol of mux2a1 is
begin 
	with sel select 
		K<= x WHEN '1',
			 y WHEN '0',
			 (others => '0') when others;
END sol;