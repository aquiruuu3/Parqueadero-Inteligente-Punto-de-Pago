-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity count_up is

	port ( Resetn, Clock, En, Load : in std_logic;
										Ent : in std_logic_vector(2 downto 0);
										Q	 :	buffer std_logic_vector(2 downto 0));
end count_up;

architecture sol of count_up is
begin
	process(Resetn, Clock)
	begin
		if Resetn = '0' then Q <= (others => '0');
		elsif (Clock'event and Clock = '1') then
				if En = '1' then
						if Load = '1' then
								Q <= Ent;
						else 
								Q <= Q + '1';
						end if;
				end if;
		end if;
	end process;
end sol;