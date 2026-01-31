-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library ieee; 
use ieee.std_logic_1164.all;

entity mux4a1 is
	port( w,x,y,z: in std_logic_vector(5 downto 0);
			sel: in std_logic_vector(1 downto 0);
			K:out std_logic_vector(5 downto 0));
end mux4a1;
architecture sol of mux4a1 is
begin 
	with sel select 
		K<= w WHEN "00",
			 x WHEN "01",
			 y WHEN "10",
			 z WHEN "11",
			 (others => '0') when others;
END sol;
				