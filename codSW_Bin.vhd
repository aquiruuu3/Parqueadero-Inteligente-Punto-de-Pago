-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
library ieee;
use ieee.std_logic_1164.all;

entity codSW_Bin is
    port (
        SW : in std_logic_vector(9 downto 0);  		-- Entrada de SWTICHES en decimal de 10 bits
        SWbin : out std_logic_vector(5 downto 0)   -- Salida a binario de 4bits
    );
end codSW_Bin;
				
architecture sol of codSW_Bin is
begin
	process (SW)
	begin
		case SW is 
				----------------- NUMEROS [DISP - HEX(3,2,1,0)] ---------------------
		
            when "0000000001" => SWbin <= "000000";  -- 0
            when "1000000000" => SWbin <= "000001";  -- 1
            when "0100000000" => SWbin <= "000010";  -- 2
            when "0010000000" => SWbin <= "000011";  -- 3
            when "0001000000" => SWbin <= "000100";  -- 4
            when "0000100000" => SWbin <= "000101";  -- 5
            when "0000010000" => SWbin <= "000110";  -- 6
            when "0000001000" => SWbin <= "000111";  -- 7
            when "0000000100" => SWbin <= "001000";  -- 8
            when "0000000010" => SWbin <= "001001";  -- 9
				when others => SWbin <= "111111";			-- OTRO

				
        end case;
    end process;
end sol;