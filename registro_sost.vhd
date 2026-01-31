-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity registro_sost is

	port( Resetn, Clock : in std_logic;
						  En : in std_logic;
					Entrada : in std_logic_vector (5 downto 0);
							Q : buffer std_logic_vector (5 downto 0)
		  );
end registro_sost;

architecture sol of registro_sost is
begin
	process(Resetn, Clock)
	begin
		if Resetn = '0' then Q <= "000000";
		
		elsif (Clock'event and Clock = '1') then
			if En = '1' then Q <= Entrada; 
			else Q <= Q;
			end if;
		end if;
		
	end process;
end sol;