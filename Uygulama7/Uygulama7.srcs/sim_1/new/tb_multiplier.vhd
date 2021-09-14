

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tb_multiplier is

end tb_multiplier;

architecture Behavioral of tb_multiplier is
component multiplier is
 Port(
	clk 	: in std_logic;
	A		: in std_logic_vector(7 downto 0);
	load	: in std_logic;
	shift_r	: in std_logic;
	dataout : out std_logic
	);
end component;

signal A : std_logic_vector(7 downto 0);
signal dataout : std_logic;
signal clk : std_logic;
signal shift_r : std_logic;
signal load : std_logic;

constant clkperiod : time := 10 ns;
begin
UUT : multiplier

port map(
		clk		=> clk,
		A		=> A,
		load		=> load,
		shift_r		=> shift_r,
		dataout		=> dataout
		);

CLKGEN : process begin
	clk	<= '1';
	wait for clkperiod/2;
	clk	<= '0';
	wait for clkperiod/2;
	end process;
	
P_STIMULI : process begin
	wait for clkperiod;
	load 	<= '1';
	A		<= x"0F";	
	wait for clkperiod;
	shift_r	<= '1';	
	load 	<= '0';	
	wait for 8*clkperiod;
	

assert false
report "Simulation has done correctly."
severity failure;


end process;
end Behavioral;
