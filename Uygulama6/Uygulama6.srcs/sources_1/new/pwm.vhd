library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pwm is
port(
	 clk		: in std_logic;
	 duty_c		: in std_logic_vector (3 downto 0);
	 pwm_s		: out std_logic
	);
end pwm;

architecture Behavioral of pwm is

constant clkfreq	: integer := 50_000_000;
constant pwmfreq	: integer := 50;		
constant counterlim	: integer := clkfreq/pwmfreq;

signal duty_pwm		: integer range 0 to counterlim := counterlim/2;
signal counter		: integer range 0 to counterlim := 0;	

begin


process (clk,duty_c) begin
	if(duty_c = "0000") then
	duty_pwm	<= 0*(counterlim/100);
	elsif( duty_c = "0001") then
	duty_pwm	<= 7*(counterlim/100);
	elsif( duty_c = "0010") then
	duty_pwm	<= 13*(counterlim/100);
	elsif( duty_c = "0011") then
	duty_pwm	<= 20*(counterlim/100);
	elsif( duty_c = "0100") then
	duty_pwm	<= 27*(counterlim/100);
	elsif( duty_c = "0101") then
	duty_pwm	<= 33*(counterlim/100);
	elsif( duty_c = "0110") then
	duty_pwm	<= 40*(counterlim/100);
	elsif( duty_c = "0111") then
	duty_pwm	<= 47*(counterlim/100);
	elsif( duty_c = "1000") then
	duty_pwm	<= 53*(counterlim/100);
	elsif( duty_c = "1001") then
	duty_pwm	<= 60*(counterlim/100);
	elsif( duty_c = "1010") then
	duty_pwm	<= 67*(counterlim/100);
	elsif( duty_c = "1011") then
	duty_pwm	<= 73*(counterlim/100);
	elsif( duty_c = "1100") then
	duty_pwm	<= 80*(counterlim/100);
	elsif( duty_c = "1101") then
	duty_pwm	<= 87*(counterlim/100);
	elsif( duty_c = "1110") then
	duty_pwm	<= 93*(counterlim/100);
	elsif( duty_c = "1111") then
	duty_pwm	<= 100*(counterlim/100);
	end if;

if (rising_edge(clk)) then
	if (counter = counterlim-1) then 	-- counterlim-1 olcak ! counter = 0 dan başlıyor.
		counter		<= 0;
	elsif (counter < duty_pwm) then 	-- 1 duty_pwm'e kadar
		pwm_s		<= '1';
		counter		<= counter + 1;
	else
		pwm_s		<= '0';				-- duty_pwm'den counterlim-1'e kadar 0
		counter		<= counter + 1;		
	end if;
end if;

end process;
	
end Behavioral;