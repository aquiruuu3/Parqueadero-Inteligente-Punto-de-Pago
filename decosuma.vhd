-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
library ieee;
use ieee.std_logic_1164.all;


entity decosuma is
    port (
        bcd : in std_logic_vector(5 downto 0);  
        segmentos : out std_logic_vector(5 downto 0) 
    );
end decosuma;

architecture sol of decosuma is
begin
    process(bcd)
    begin
	 
	 --------------------- CATODO COMUN ,veras jacob --------------------------
	 
        case bcd is
            when "000000" => segmentos <= "000000";  -- 0
            when "000001" => segmentos <= "001010";  -- 1
            when "000010" => segmentos <= "010100";  -- 2
            when "000011" => segmentos <= "011110";  -- 3
            when "000100" => segmentos <= "101000";  -- 4
            when others => segmentos <= "111111";  
        end case;
    end process;
end sol;
