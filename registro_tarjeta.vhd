-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity registro_tarjeta is

	port( Resetn, Clock : in std_logic;
						  En : in std_logic;
					Entrada : in std_logic_vector (3 downto 0);
							Q : buffer std_logic_vector (3 downto 0)
		  );
end registro_tarjeta;

architecture sol of registro_tarjeta is
begin
	process(Resetn, Clock)
	begin
		if Resetn = '0' then Q <= "0000";
		
		elsif (Clock'event and Clock = '1') then
			if En = '1' then Q <= Entrada; 
			else Q <= Q;
			end if;
		end if;
		
	end process;
end sol;