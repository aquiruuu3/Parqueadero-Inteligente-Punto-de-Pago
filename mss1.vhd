-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 
 */
library ieee; 
use ieee.std_logic_1164.all; 

entity mss1 is 

	port(	Clock, resent 											:	in std_logic;  
			ok,start,comprar,billete,billetes				:	in std_logic; 
			existe,tarjetaaceptada								:	in std_logic; 
			Rs6, Rs7, Rs8, Rs13 									:	out std_logic;
			En6, En7, En8, En13 									:	out std_logic;
			enLlenado, recarga, encendido 					:	out std_logic;
			RsTarjA,RsTarjB,RsTarjC,RsTarjD 					:	out std_logic;
			Rsvalida,      	Envalida 						:	out std_logic;
			Rsbilletes,    	Enbilletes 						:	out std_logic;
			Rscontador_dis,	contador_dis 					:	out std_logic;
			RsconteoA,RsconteoB,RsconteoC,RsconteoD 		:	out std_logic;
			tarjetas,numeros,confirm,bill,pasar 			:	out std_logic
			);
			
end mss1; 

architecture solucion of mss1 is
type estado is (A1,B1,D1,C1,E1,F1,I1,H1,J1,K1,O1,A2,B2,C2,D2,E2,F2,A,B,C,D,E,F,G,H,I,J,K,O,P1,P0,P2);
signal y:estado;
begin 
      process(Clock, resent)
		begin 
		if resent='0' then y<= A1; 
      elsif (Clock'event and Clock ='1')then
          case y is 
			 
			      -- Ingresa start para empezar
					when A1=> if start='1' then y<= B1; 
							   else y<= A1;
								end if; 
					when B1=> if start ='0' then y<= C1; 
							   else y<= B1;
								end if; 
					when C1=> y<=D1;
					
					-- Ingreso de numero de tarjeta 
					when D1=> if ok ='1' then y<= E1; 
							   else y<= D1;
								end if; 
					when E1=> if ok ='0' then y<= F1; 
							   else y<= E1;
								end if; 
					when F1=> y<=H1;
					
					--	Valida cupo disponible vs numero ingresado 
					when H1=> if existe='0' then y<= A; 
							   else y<= I1 ;
								end if; 
					when I1=> y<=J1;
					
					-- Menú de compra de nueva tarjeta
					when J1=> if comprar='1' then y<= K1; 
							   else y<= J1;
								end if; 
					when K1=> if comprar ='0' then y<= O1; 
							   else y<= K1;
								end if; 
               when O1=> y<=A2;
					-- Ingresar los billeres a la maquina
					when A2=> if billete='1' then y<= B2; 
							   else y<= A2;
								end if; 
					when B2=> if billete ='0' then y<= C2; 
							   else y<= B2;
								end if; 
               when C2=> y<=D2;
					
					-- Valida la cantidad de billetes (5) ingresados
					when D2=> if billeteS ='1' then y<= E2; 
							   else y<= A2;
								end if; 
					when E2=> y<=F2;
					when F2=> y<=H1;
			      
					-- Ingresa primer dígito de horas a consumir
					when A=> if ok ='1' then y<= B; 
							   else y<= A;
								end if; 
					when B=> if ok ='0' then y<= C; 
							   else y<= B;
								end if; 
					when C=> y<=D;
					
					-- Ingresa segundo dígito de horas a consumir
					when D=> if ok ='1' then y<= E; 
							   else y<= D;
								end if; 
					when E=> if ok ='0' then y<= F; 
							   else y<= E;
								end if; 
					when F=> y<=G;
					
					-- Confirma los datos ingresados (tarjeta, horas de consumo)
					when G=> if ok ='1' then y<= H; 
							   else y<= G;
								end if; 
					when H=> if ok ='0' then y<= I; 
							   else y<= H;
								end if; 
					when I=> y<=J;
					
					-- Resta las horas ingresadas y actualiza cupo disponible 
					when J=> if tarjetaaceptada ='1' then y<= K; 
							   else y<= A;
								end if; 
								
					when K=> y<=O;
				   when O=> y<=P0;
					when P0=> y<=P1;
					when P1=> if ok ='1' then y<= P2; 
							   else y<= P1;
								end if; 
					when P2=> if ok ='0' then y<= D1; 
								else y<= P2;
								end if; 
          end case;
     end if;
end process; 
process(y)
	begin 
	
	Rs6<='1';Rs7<='1';Rs8<='1';Rs13<='1';									-- Inicialización de señales RESET
	RsTarjA<='1';RsTarjB<='1';RsTarjC<='1';RsTarjD<='1';
	Rsbilletes<='1';Rsvalida<='1';Rscontador_dis<='1';
	RsconteoA<='1';RsconteoB<='1';RsconteoC<='1';RsconteoD<='1';
	
	En6<='0';En7<='0';En8<='0';En13<='0';									-- Inicialización de señales ENABLE
	enLlenado<='1';recarga<='1';encendido<='1';
	Envalida<='0';Enbilletes<='0';contador_dis<='0';
	
	tarjetas<='0';numeros<='0';confirm <='0';bill<='0';pasar<='0';	-- Inicialización de señales de bloques y salidas
	
	 case y is 
	 
	   -- INICIO : Ingreso de datos
		when A1=>  Rs6<='0';Rs7<='0';Rs8<='0';Rs13<='0';
					  RsTarjA<='0';RsTarjB<='0';RsTarjC<='0';RsTarjD<='0';
					  Rsvalida<='0';encendido<='0';
					  RsconteoA<='0';RsconteoB<='0';RsconteoC<='0';RsconteoD<='0';
					  
		when B1=>  encendido<='0';
		
		when D1=>  encendido<='0';
					  Rs13<='0'; Rs6<='0';Rs7<='0';Rs8<='0';
					  Rsvalida<='0';Rscontador_dis<='0';tarjetas<='1';
					  
		when C1=>  encendido<='0';enLlenado<='0';recarga<='0';
		when E1=>  encendido<='0';
		when F1=>  encendido<='0';En13<='1';
		when H1=>  Rsbilletes<='0';Rsvalida<='0';
		when I1=> 
		when J1=>  confirm <='1';
		when K1=> 
		when O1=>
		when A=>   Rs6<='0';Rs7<='0';Rs8<='0';numeros<='1';
		when B=> 
		when C=>   En6<='1';
		when D=> 
		when E=> 
		when F=>   En7<='1';
	   when G=>
		when H=> 
		when I=>   En8<='1';
		when J=> 
		
		-- GASTO DE HORAS 
		when K=>  enLlenado<='1';recarga<='1';Envalida<='1';contador_dis<='1';
		when O=>  contador_dis<='1';
		when A2=> bill<='1';
		when B2=>
	   when C2=> Enbilletes<='1';
		when D2=> 
		when E2=> enLlenado<='1';recarga<='0';Envalida<='1';    
		when F2=> enLlenado<='1';recarga<='0';Envalida<='1';   
		when P0=> encendido<='0';Rs13<='0'; Rs6<='0';Rs7<='0';Rs8<='0';Rsvalida<='0';
    	when P1=> encendido<='0';Rs13<='0'; Rs6<='0';Rs7<='0';Rs8<='0';Rsvalida<='0';pasar<='1';
	   when P2=> encendido<='0';Rs13<='0'; Rs6<='0';Rs7<='0';Rs8<='0';Rsvalida<='0';
	
	 end case;
end process; 
end solucion; 
					