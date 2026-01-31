-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decodificador_contador is
    port(
        x: in std_logic_vector(6 downto 0);
		  unidad :out std_logic_vector(6 downto 0);
        decena : out std_logic_vector(6 downto 0));
end decodificador_contador;

architecture comportamiento of decodificador_contador is
begin
    process(x)
    begin
	     if x >= ("1011010") then
					decena <= "0001001"; 			unidad <= x + not("1011010")+ "0000001";
			  
	     elsif (x >= "1010000" and x <= "1011001") then					--80
					decena <= "0001000"; 			unidad <= x + not("1010000")+ "0000001";
			 
	     elsif (x >= "1000110" and x <= "1001111") then					--70
					decena <= "0000111"; 			unidad <= x + not("1000110")+ "0000001";
			 
	     elsif (x >= "0111100" and x <= "1000101") then					--60
					decena <= "0000110"; 			unidad <= x + not("0111100")+ "0000001";
			 
	     elsif (x >= "0110010" and x <= "0111011") then					--50
					decena <= "0000101"; 			unidad <= x + not("0110010")+ "0000001";
			  
        elsif (x >= "0101000" and x <= "0110001") then					--40
					decena <= "0000100"; 			unidad <= x + not("0101000")+ "0000001";
			 
        elsif (x >= "0011110" and x <= "0100111") then					--30
					decena <= "0000011"; 			unidad <= x + not("0011110")+ "0000001";
			  
        elsif (x >= "0010100" and x <= "0011101") then					--20
					decena <= "0000010"; 			unidad <= x + not("0010100")+ "0000001";
				
        elsif (x >= "0001010" and x <= "0010011") then					--10
					decena <= "0000001"; 			unidad <= x + not("0001010")+ "0000001";
			  
			elsif (x >= "0000000" and x <= "0001001") then					--00
					decena <= "0000000"; 			unidad <= x ;
        else
            decena <= "1111111";unidad <= "1111111"; -- Valor por defecto si no coincide con ningún caso
        end if;
		  end process;
end comportamiento;