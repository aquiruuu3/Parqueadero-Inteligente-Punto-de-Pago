library ieee; 
use ieee.std_logic_1164.all; 

entity mss is 

	port(Clock, resent, ok:in std_logic; 
			Rs6,Rs7,Rs8,En6,En7,En8:out std_logic);
			
end mss; 

architecture solucion of mss is
type estado is (A,B,C,D,E,F,G,H,I,J,K,M);
signal y:estado;
begin 
      process(Clock, resent)
		begin 
		if resent='0' then y<= A; 
      elsif (Clock'event and Clock ='1')then
          case y is 
					when A=> if ok ='1' then y<= B; 
							   else y<= A;
								end if; 
					when B=> if ok ='0' then y<= C; 
							   else y<= B;
								end if; 
					when C=> y<=D;
					--
					when D=> if ok ='1' then y<= E; 
							   else y<= D;
								end if; 
					when E=> if ok ='0' then y<= F; 
							   else y<= E;
								end if; 
					when F=> y<=G;
					--
					when G=> if ok ='1' then y<= H; 
							   else y<= G;
								end if; 
					when H=> if ok ='0' then y<= C; 
							   else y<= H;
								end if; 
					when I=> y<=J;
					--
					when J=> if ok ='1' then y<= M; 
							   else y<= J;
								end if; 
					when M=> if ok ='0' then y<= A; 
							   else y<= M;
								end if; 
          end case;
     end if;
end process; 
process(y)
	begin 
   Rs1<='1';Rs2<='1';Rs3<='1';Rs4<='1';Rs5<='1';Rs6<='1';Rs7<='1';Rs8<='1'; Rs9<='1';Rs10<='1';Rs11<='1';Rs12<='1';Rs20<='1';En6<='0';En20<='0'; En7<='0';En8<='0';En5<='0';reg<='1';sel<='0';
	 case y is 
		when A=> Rs1<='1';Rs2<='1';Rs3<='1';Rs4<='1';
		when B=> 
		when C=> reg<='0';
		when D=> Rs5<='0';Rs20<='0';
		when E=> Rs6<='0';Rs7<='0';Rs8<='0';
		when F=> En6<='1';
	   when G=>
		when H=> En7<='1';
		when I=> 
		when J=> 
		when K=> 
		when p=> En8<='1';
	   when M=> sel<='1';En5<='1';
		when L=> sel<='1';En5<='1';	
		when R=> Rs6<='0';Rs7<='0';Rs8<='0';
		when S=> 
		when T=> 
		when U=> 
		when W=> En20<='1';
		when V=> 
	   when N=> 
		when X=> En5<='1';
		when Q=> En5<='1';
	 end case;
end process; 
end solucion; 
					
								