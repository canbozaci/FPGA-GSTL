library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_product is
--  Port ( );
end tb_product;

architecture Behavioral of tb_product is
component product is
Port (
	clk 	: in std_logic;
	reset	: in std_logic;
	load 	: in std_logic;
	shift_r : in std_logic;
	datain	: in std_logic_vector(8 downto 0);
	dataout	: out std_logic_vector (15 downto 0)
 );
end component;

signal clk 		: std_logic;
signal reset	: std_logic;
signal load 	: std_logic;
signal shift_r 	: std_logic;
signal datain	: std_logic_vector(8 downto 0);
signal dataout	: std_logic_vector (15 downto 0);

constant clkperiod : time := 10 ns;

begin
UUT : product

port map(
		clk		=> clk,
		reset		=> reset,
		load		=> load,
		shift_r		=> shift_r,
		datain		=> datain,
		dataout		=> dataout
		);

CLKGEN : process begin
	clk	<= '1';
	wait for clkperiod/2;
	clk	<= '0';
	wait for clkperiod/2;
	end process;
P_STIMULI : process begin
	reset 	<= '1';
	wait for 20ns;	
	reset	<= '0';
	load	<= '1';
	datain	<= "101001111";
	wait for 10ns;
	load	<= '0';
	shift_r	<= '1';
	wait for 10ns;
	shift_r	<= '0';
	wait for 10ns;
	load	<= '1';
	datain	<= "011101001";
	wait for 10ns;
	load	<= '0';
	shift_r	<= '1';
	wait for 10ns;
	shift_r	<= '0';
	wait for 10ns;
	
	assert false
	report "Simulation has done correctly."
	severity failure;

end process;
end Behavioral;
