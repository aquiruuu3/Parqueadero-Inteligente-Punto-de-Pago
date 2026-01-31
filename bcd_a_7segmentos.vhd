-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
library ieee;
use ieee.std_logic_1164.all;


entity bcd_a_7segmentos is
    port (
        bcd : in std_logic_vector(5 downto 0);  -- Entrada BCD de 4 bits
        segmentos : out std_logic_vector(6 downto 0)  -- Salida a 7 segmentos
    );
end bcd_a_7segmentos;

architecture sol of bcd_a_7segmentos is
begin
    process(bcd)
    begin
	 
	 --------------------- anodo COMUN  --------------------------
	 
        case bcd is
            when "000000" => segmentos <= "0000001";  -- 0
            when "000001" => segmentos <= "1001111";  -- 1
            when "000010" => segmentos <= "0010010";  -- 2
            when "000011" => segmentos <= "0000110";  -- 3
            when "000100" => segmentos <= "1001100";  -- 4
            when "000101" => segmentos <= "0100100";  -- 5
            when "000110" => segmentos <= "0100000";  -- 6
            when "000111" => segmentos <= "0001111";  -- 7
            when "001000" => segmentos <= "0000000";  -- 8
            when "001001" => segmentos <= "0000100";  -- 9
            when others => segmentos <= "1111111";  

        end case;
    end process;
end sol;
