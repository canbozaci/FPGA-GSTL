

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_module4 is
--  Port ( );
end tb_module4;

architecture Behavioral of tb_module4 is
component module_4 is
 Port (
	clk 	: in std_logic;
	data_i	: in std_logic_vector(7 downto 0);
	load	: in std_logic;
	data_o	: out std_logic_vector(8 downto 0)
 );
end component;

	signal clk : std_logic;
	signal data_i : std_logic_vector(7 downto 0);
	signal load	 : std_logic:='0';
	signal data_o : std_logic_vector(8 downto 0);
	
	constant clkperiod : time := 10 ns;
begin
UUT : module_4
port map(
		clk			=> clk,
		data_i		=> data_i,
		load		=> load,
		data_o		=> data_o
		);

CLKGEN : process begin
	clk	<= '0';
	wait for clkperiod/2;
	clk	<= '1';
	wait for clkperiod/2;
	end process;

P_STIMULI : process begin
wait for 10ns;

data_i 	<= "00011010";
load	<= '1';
wait for clkperiod;
load	<= '0';
wait for 10*clkperiod;
data_i 	<= "11111111";
load	<= '1';
wait for clkperiod;
load	<= '0';
wait for 10*clkperiod;
data_i 	<= "00000000";
load	<= '1';
wait for clkperiod;
load	<= '0';
wait for 10*clkperiod;
data_i 	<= "10101000";
load	<= '1';
wait for clkperiod;
load	<= '0';
wait for 10*clkperiod;
data_i 	<= "10101001";
load	<= '1';
wait for clkperiod;
load	<= '0';
wait for 10*clkperiod;

data_i 	<= "10101000";
load	<= '1';
wait for clkperiod;
load	<= '0';
wait for 10*clkperiod;


assert false
report "Simulation has done correctly."
severity failure;




end process;
end Behavioral;
