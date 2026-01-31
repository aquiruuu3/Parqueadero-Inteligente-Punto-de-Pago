-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */

library ieee; 
use ieee.std_logic_1164.all;

entity mux4a1_acumulador is
	port( w,x,y,z: in std_logic_vector(6 downto 0);
			sel: in std_logic_vector(1 downto 0);
			K:out std_logic_vector(6 downto 0));
end mux4a1_acumulador;
architecture sol of mux4a1_acumulador is
begin 
	with sel select 
		K<= w WHEN "00",
			 x WHEN "01",
			 y WHEN "10",
			 z WHEN "11",
			 (others => '0') when others;
END sol;
				