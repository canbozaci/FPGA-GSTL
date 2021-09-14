library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;

entity tb_GCD is
--  Port ( );
end tb_GCD;

architecture Behavioral of tb_GCD is
component GCD is
	Port (
	clk		: in std_logic;
	go_i 	: in std_logic;
	x_i	  	: in std_logic_vector(31 downto 0);
	y_i	  	: in std_logic_vector(31 downto 0);
	d_o	 	: out std_logic_vector(31 downto 0)
	);
	end component;
	
signal clk	: std_logic;
signal go_i : std_logic:='0';
signal x_i	: std_logic_vector(31 downto 0):=( others => '0');
signal y_i	: std_logic_vector(31 downto 0):=( others => '0');
signal d_o	: std_logic_vector(31 downto 0):=( others => '0');

constant clkperiod : time := 10 ns;
	
begin
UUT: GCD
port map(
	clk	  => clk	,
	go_i  => go_i   ,
	x_i	  => x_i	,
	y_i	  => y_i	,
	d_o	  => d_o
	);
	
CLKGEN : process begin
	clk	<= '1';
	wait for clkperiod/2;
	clk	<= '0';
	wait for clkperiod/2;
	end process;
	
P_STIMULI : process begin
	wait for 40ns;
    x_i 	<= CONV_STD_LOGIC_VECTOR(9,32);
	y_i		<= CONV_STD_LOGIC_VECTOR(1,32);
	go_i 	<= '1';
	wait for 40 ns;
	go_i 	<= '0';
    wait for 1000*clkperiod;
	x_i 	<= CONV_STD_LOGIC_VECTOR(70,32);
	y_i		<= CONV_STD_LOGIC_VECTOR(560,32);
	go_i 	<= '1';
	wait for 40 ns;
	go_i 	<= '0';
    wait for 1000*clkperiod;
	x_i 	<= CONV_STD_LOGIC_VECTOR(85,32);
	y_i		<= CONV_STD_LOGIC_VECTOR(221,32);
	go_i 	<= '1';
	wait for 40 ns;
	go_i 	<= '0';
    wait for 1000*clkperiod;
	x_i 	<= CONV_STD_LOGIC_VECTOR(350,32);
	y_i		<= CONV_STD_LOGIC_VECTOR(350,32);
	go_i 	<= '1';
	wait for 40 ns;
	go_i 	<= '0';
    wait for 1000*clkperiod;
	x_i 	<= CONV_STD_LOGIC_VECTOR(200,32);
	y_i		<= CONV_STD_LOGIC_VECTOR(2,32);
	go_i 	<= '1';
	wait for 40 ns;
	go_i 	<= '0';
    wait for 2000*clkperiod;
	
	assert false
	report "Simulation has done correctly."
	severity failure;
	
	
end process;
end behavioral;