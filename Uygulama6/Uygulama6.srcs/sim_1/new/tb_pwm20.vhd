library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_pwm20 is
end tb_pwm20;

architecture Behavioral of tb_pwm20 is

component pwm_20 is
	port(
		clk			: in std_logic;
		pwm_s		: out std_logic
		);
end component;

signal clk			: std_logic := '0';
signal pwm_s		: std_logic;

constant clkperiod	: time := 20 ns;

begin

UUT : pwm_20
port map(
		clk			=> clk,
		pwm_s	=> pwm_s		
		);

CLKGEN : process begin
	clk	<= '0';
	wait for clkperiod/2;
	clk	<= '1';
	wait for clkperiod/2;
	end process;

P_STIMULI : process begin
	wait for 400 ms;
assert false
report "Simulation has done correctly."
severity failure;

end process;
end Behavioral;