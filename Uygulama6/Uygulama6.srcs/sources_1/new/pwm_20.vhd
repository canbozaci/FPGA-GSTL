library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pwm_20 is
port(
	 clk		: in std_logic;
	 pwm_s		: out std_logic
	);
end pwm_20;

architecture Behavioral of pwm_20 is

constant clkfreq	: integer := 50_000_000;	 -- system clock freq, T= 20ns için
constant pwmfreq	: integer := 50;           -- PWM freq istedigim gibi seçiyorum T = 20 ms;
	
constant counterlim	: integer := clkfreq/pwmfreq;
	
signal duty_pwm		: integer range 0 to counterlim := counterlim/2;
signal counter		: integer range 0 to counterlim := 0;

begin
duty_pwm	<= (counterlim/100)*20;  -- CONV_INTEGER ARITH'in kutuphanesinde var.

process (clk) begin
if (rising_edge(clk)) then
	if (counter = counterlim-1) then 	-- counterlim-1 olcak ! counter = 0 dan başlıyor.
		counter		<= 0;
	elsif (counter < duty_pwm) then 	-- 1 duty_pwm'e kadar
		pwm_s		<= '1';
		counter		<= counter + 1;
	else
		pwm_s		<= '0';					-- duty_pwm'den counterlim-1'e kadar 0
		counter		<= counter + 1;		
	end if;
end if;
end process;
end Behavioral;