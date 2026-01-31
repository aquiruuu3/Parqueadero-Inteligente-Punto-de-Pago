-- Ana Quiroga
-- Jacob Sancho
/*
SISTEMA DE PARQUEADERO INTELIGENTE CON CONTROL DE TIEMPO
 Y COBRO AUTOMATIZADO MEDIANTE TARJETAS 

 
Este código genera varias señales de reloj con frecuencias más bajas
a partir de un reloj maestro de 50 MHz. Utiliza divisores de frecuencia
en cascada para minimizar el uso de hardware adicional.

*/

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity clock_div_50aa is
    port
    (  clock_50MHz    :		in   std_logic;
       clock_1MHz     :		out  std_logic;
       clock_100KHz   :		out  std_logic;
       clock_10KHz    :		out  std_logic;
       clock_1KHz     :		out  std_logic;
       clock_100Hz    :		out  std_logic;
       clock_10Hz     :		out  std_logic;
       clock_1Hz      :		out  std_logic);
end clock_div_50aa;

architecture solclck of clock_div_50aa is
    signal   count_1Mhz: std_logic_vector(5 downto 0);
    signal   count_100Khz, count_10Khz, count_1Khz: std_logic_vector(2 downto 0);
    signal   count_100hz, count_10hz, count_1hz: std_logic_vector(2 downto 0);
    signal   clock_1Mhz_int, clock_100Khz_int, clock_10Khz_int, clock_1Khz_int: std_logic;
    signal   clock_100hz_int, clock_10hz_int, clock_1hz_int: std_logic;

begin
    -- Divisor para generar una señal de 1 MHz a partir de 50 MHz.
    process
    begin
        wait until clock_50MHz'event and clock_50MHz = '1';  -- Flanco positivo del reloj de 50 MHz.
        if count_1Mhz < 49 then
            count_1Mhz <= count_1Mhz + 1;
        else
            count_1Mhz <= "000000";
        end if;

        -- Genera señal de 1 MHz basada en el valor del contador.
        if count_1Mhz < 25 then
            clock_1Mhz_int <= '0';  -- Media onda baja.
        else
            clock_1Mhz_int <= '1';  -- Media onda alta.
        end if;

        -- Actualiza las señales de salida con las señales internas sincronizadas.
        clock_1MHz <= clock_1Mhz_int;
        clock_100KHz <= clock_100Khz_int;
        clock_10KHz <= clock_10Khz_int;
        clock_1KHz <= clock_1Khz_int;
        clock_100Hz <= clock_100hz_int;
        clock_10Hz <= clock_10hz_int;
        clock_1Hz <= clock_1hz_int;
    end process;

	 
    -- [Divisor para generar 100 kHz a partir de 1 MHz]
    process
    begin
        wait until clock_1Mhz_int'event and clock_1Mhz_int = '1';
        if count_100Khz /= 4 then
            count_100Khz <= count_100Khz + 1;
        else
            count_100Khz <= "000";
            clock_100Khz_int <= not clock_100Khz_int;  -- Alternar el estado del reloj.
        end if;
    end process;

	 
    -- [Divisor para generar 10 kHz a partir de 100 kHz]
    process
    begin
        wait until clock_100Khz_int'event and clock_100Khz_int = '1';
        if count_10Khz /= 4 then
            count_10Khz <= count_10Khz + 1;
        else
            count_10Khz <= "000";
            clock_10Khz_int <= not clock_10Khz_int;
        end if;
    end process;

	 
    -- [Divisor para generar 1 kHz a partir de 10 kHz]
    process
    begin
        wait until clock_10Khz_int'event and clock_10Khz_int = '1';
        if count_1Khz /= 4 then
            count_1Khz <= count_1Khz + 1;
        else
            count_1Khz <= "000";
            clock_1Khz_int <= not clock_1Khz_int;
        end if;
    end process;

	 
    -- [Divisor para generar 100 Hz a partir de 1 kHz]
    process
    begin
        wait until clock_1Khz_int'event and clock_1Khz_int = '1';
        if count_100hz /= 4 then
            count_100hz <= count_100hz + 1;
        else
            count_100hz <= "000";
            clock_100hz_int <= not clock_100hz_int;
        end if;
    end process;

	 
    -- [Divisor para generar 10 Hz a partir de 100 Hz]
    process
    begin
        wait until clock_100hz_int'event and clock_100hz_int = '1';
        if count_10hz /= 4 then
            count_10hz <= count_10hz + 1;
        else
            count_10hz <= "000";
            clock_10hz_int <= not clock_10hz_int;
        end if;
    end process;

	 
    -- [Divisor para generar 1 Hz a partir de 10 Hz]
    process
    begin
        wait until clock_10hz_int'event and clock_10hz_int = '1';
        if count_1hz /= 4 then
            count_1hz <= count_1hz + 1;
        else
            count_1hz <= "000";
            clock_1hz_int <= not clock_1hz_int;
        end if;
    end process;
	 
end solclck;
