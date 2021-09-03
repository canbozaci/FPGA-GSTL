

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_Multiplicand is
--  Port ( );
end tb_Multiplicand;

architecture Behavioral of tb_Multiplicand is
component Multiplicand is
    Port ( 
    clk		: in std_logic;
    dataout : out std_logic_vector(7 downto 0);
    B		: in std_logic_vector(7 downto 0);
    load 	: in std_logic
	);
end component;

signal clk		: std_logic;
signal B		: std_logic_vector(7 downto 0);
signal dataout 	: std_logic_vector(7 downto 0);
signal load		: std_logic;

constant clkperiod : time := 10 ns;

begin
UUT : Multiplicand

port map(
		clk		=> clk,
		B		=> B,
		load		=> load,
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
	B		<= x"0e";	
	wait for clkperiod;
	load 	<= '0';	
	wait for clkperiod;
	B		<= x"Ff";	
	wait for clkperiod;
	wait for clkperiod;
	load 	<= '1';
	B		<= x"00";	
	wait for clkperiod;
	load 	<= '0';	
	wait for clkperiod;
	
	assert false
	report "Simulation has done correctly."
	severity failure;
end process;
end Behavioral;
