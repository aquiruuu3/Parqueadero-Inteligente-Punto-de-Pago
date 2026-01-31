-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity decodificador1 is
    port(
        x: in std_logic_vector(5 downto 0);
		  w :out std_logic_vector(5 downto 0);
        u : out std_logic_vector(5 downto 0));
end decodificador1;

architecture comportamiento of decodificador1 is
begin
    process(x)
    begin
        if (x >= "101000" and x <= "110001") then			--40
		  
           u <= "000100"; w <= x + not("101000")+ "000001";
			  
        elsif (x >= "011110" and x <= "100111") then		--30
		  
            u <= "000011"; w <= x + not("011110")+ "000001";
				
        elsif (x >= "010100" and x <= "011101") then		--20
		  
            u <= "000010"; w <= x + not("010100")+ "000001";
				
        elsif (x >= "001010" and x <= "010011") then		--10
		  
            u <= "000001"; w <= x + not("001010")+ "000001";
				
			elsif (x >= "000000" and x <= "001001") then		--00
	  
            u <= "000000"; w <= x ;
        else
            u <= "111111";w <= "111111"; -- Valor por defecto si no coincide con ningún caso
				
        end if;
		  end process;
end comportamiento;
		