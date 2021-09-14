library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_pwm is
end tb_pwm;

architecture Behavioral of tb_pwm is

component pwm is
	port(
		clk			: in std_logic;
		duty_c		: in std_logic_vector (3 downto 0);
		pwm_s		: out std_logic
		);
end component;

signal clk			: std_logic := '0';
signal duty_c		: std_logic_vector (3 downto 0) := (others => '0');
signal pwm_s		: std_logic;

constant clkperiod	: time := 20 ns;

begin

UUT : pwm
port map(
		clk			=> clk,
		duty_c		=> duty_c,
		pwm_s	=> pwm_s		
		);

CLKGEN : process begin
	clk	<= '0';
	wait for clkperiod/2;
	clk	<= '1';
	wait for clkperiod/2;
	end process;

P_STIMULI : process begin

	duty_c	<= "0000";
	wait for 40 ms;
	duty_c	<= "0001";
	wait for 40 ms;
	duty_c	<= "0010";
	wait for 40 ms;
	duty_c	<= "0011";
	wait for 40 ms;
	duty_c	<= "0100";
	wait for 40 ms;
	duty_c	<= "0101";
	wait for 40 ms;
	duty_c	<="0110";
	wait for 40 ms;
	duty_c	<= "0111";
	wait for 40 ms;
	duty_c	<= "1000";
	wait for 40 ms;
	duty_c	<= "1001";
	wait for 40 ms;
	duty_c	<= "1010";
	wait for 40 ms;
	duty_c	<= "1011";
	wait for 40 ms;
	duty_c	<= "1100";
	wait for 40 ms;
	duty_c	<= "1101";
	wait for 40 ms;
	duty_c	<="1110";
	wait for 40 ms;
	duty_c	<= "1111";
	wait for 20.000010000 ms;
assert false
report "Simulation has done correctly."
severity failure;

end process;
end Behavioral;