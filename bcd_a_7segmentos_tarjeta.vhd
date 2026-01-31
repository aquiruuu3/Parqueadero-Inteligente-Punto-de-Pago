-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
library ieee;
use ieee.std_logic_1164.all;


entity bcd_a_7segmentos_tarjeta is
    port (
        bcd : in std_logic_vector(3 downto 0);  -- Entrada BCD de 4 bits
        segmentos : out std_logic_vector(6 downto 0)  -- Salida a 7 segmentos
    );
end bcd_a_7segmentos_tarjeta;

architecture sol of bcd_a_7segmentos_tarjeta is
begin
    process(bcd)
    begin
	 
	 --------------------- anodo COMUN ,veras jacob --------------------------
	 
        case bcd is
            when "1000" => segmentos <= "1001111";  -- 1
            when "0100" => segmentos <= "0010010";  -- 2
            when "0010" => segmentos <= "0000110";  -- 3
            when "0001" => segmentos <= "1001100";  -- 4
            when others => segmentos <= "0000001";  
		  end case;
    end process;
end sol;
