-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */

library ieee;
use ieee.std_logic_1164.all;


entity bcd_a_7segmentos_contador is
    port (
        bcd : in std_logic_vector(6 downto 0);  -- Entrada BCD de 4 bits
        segmentos : out std_logic_vector(6 downto 0)  -- Salida a 7 segmentos
    );
end bcd_a_7segmentos_contador;

architecture sol of bcd_a_7segmentos_contador is
begin
    process(bcd)
    begin
	 
	 --------------------- anodo COMUN ,veras jacob --------------------------
	 
        case bcd is
		  			
				when "0000000" => segmentos <= "1111110";  -- 0
            when "0000001" => segmentos <= "0110000";  -- 1
            when "0000010" => segmentos <= "1101101";  -- 2
            when "0000011" => segmentos <= "1111001";  -- 3
            when "0000100" => segmentos <= "0110011";  -- 4
            when "0000101" => segmentos <= "1011011";  -- 5
            when "0000110" => segmentos <= "1011111";  -- 6
            when "0000111" => segmentos <= "1110000";  -- 7
            when "0001000" => segmentos <= "1111111";  -- 8
            when "0001001" => segmentos <= "1111011";  -- 9
            when others => segmentos <= "0000000";
        end case;
    end process;
end sol;

