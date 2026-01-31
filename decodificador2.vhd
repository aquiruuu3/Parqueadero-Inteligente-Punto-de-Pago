-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decodificador2 is
    port(
        x: in std_logic_vector(7 downto 0);
		  unidad :out std_logic_vector(7 downto 0);
        decena : out std_logic_vector(7 downto 0);
		  centena : out std_logic_vector(7 downto 0));
end decodificador2;

architecture comportamiento of decodificador2 is
begin
    process(x)
    begin

        if (x >= "01000110" and x <= "01001111") then			--70
          centena  <= "00000000"; 
			 decena  <= "00000111"; 
			 unidad <= x + not("001000110")+ "00000001";
			 
        elsif (x >= "00111100" and x <= "01000101") then		--60
          centena  <= "00000000"; 
			 decena  <= "00000110"; 
			 unidad <= x + not("00111100")+ "00000001";
			 
        elsif (x >= "00110010" and x <= "00111011") then		--50 
          centena  <= "00000000"; 
			 decena  <= "00000101"; 
			 unidad <= x + not("00110010")+ "00000001";
			 
        elsif (x >= "00101000" and x <= "00110001") then		--40
          centena  <= "00000000"; 
			 decena  <= "00000100"; 
			 unidad <= x + not("00101000")+ "00000001";
			 
        elsif (x >= "00011110" and x <= "00100111") then		--30
          centena  <= "00000000";  
			 decena  <= "00000011"; 
			 unidad <= x + not("00011110")+ "00000001";
			 
        elsif (x >= "00010100" and x <= "00011101") then		--20
           centena  <= "000010"; 
			  decena  <= "00000010"; 
			  unidad <= x + not("00010100")+ "00000001";
			  
        elsif (x >= "00001010" and x <= "00010011") then		--10
           centena  <= "00000000"; 
			  decena  <= "00000001"; 
			  unidad <= x + not("00001010")+ "00000001";
			  
	     elsif (x >= "00000000" and x <= "00001001") then		--00
          centena  <= "00000000";  
			 decena  <= "00000000"; 
			 unidad <= x ;
			 
        else
           centena  <= "11111111"; 
			  unidad <= "11111111";
			  decena <= "11111111"; -- Valor por defecto si no coincide con ningún caso
        end if;
		  end process;
end comportamiento;