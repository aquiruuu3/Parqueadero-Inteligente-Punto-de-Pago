-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library ieee; 
use ieee.std_logic_1164.all;

entity mux2a1di is
	port( x,y: in std_logic_vector(3 downto 0);
			sel: in std_logic;
			K:out std_logic_vector(3 downto 0));
end mux2a1di ;
architecture sol of mux2a1di is
begin 
	with sel select 
		K<= x WHEN '1',
			 y WHEN '0',
			 (others => '0') when others;
END sol;