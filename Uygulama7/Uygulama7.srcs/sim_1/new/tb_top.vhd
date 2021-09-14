library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is
component top is
 Port ( 
	clk			: in std_logic;
	reset 		: in std_logic;
	start 		: in std_logic;
	A	  		: in std_logic_vector(7 downto 0);
	B	  		: in std_logic_vector(7 downto 0);
	product_t 	: out std_logic_vector(15 downto 0);
	ready		: out std_logic
 );
end component;
signal clk			: std_logic;
signal reset 		: std_logic:=('0');
signal start 		: std_logic:=('0');
signal A	  		: std_logic_vector(7 downto 0):=(others => '0');
signal B	  		: std_logic_vector(7 downto 0):=(others => '0');
signal product_t 	: std_logic_vector(15 downto 0):=(others => '0');
signal ready		: std_logic:=('0');


constant clkperiod : time := 10 ns;

begin
UUT : top
port map(
		clk		=> clk,
		reset	=> reset,
		A		=> A,
		B		=> B,
		start	=> start,
		product_t => product_t,
		ready		=> ready
		);
CLKGEN : process begin
	clk	<= '1';
	wait for clkperiod/2;
	clk	<= '0';
	wait for clkperiod/2;
	end process;

P_STIMULI : process begin
	wait for 5*clkperiod;
	-- reset 	<= '1';
	wait for 5*clkperiod;
	-- reset 	<= '0';
	wait for 2*clkperiod;
	wait for 8.4 ns;
	start	<= '1';
	A <= CONV_STD_LOGIC_VECTOR(255,8);
	B <= CONV_STD_LOGIC_VECTOR(111,8);
	wait for 2*clkperiod;
	start	<= '0';
	wait for 1*clkperiod;
	wait for 19*clkperiod;
	--------------------------------------
	start	<= '1';
	A <= CONV_STD_LOGIC_VECTOR(25,8);
	B <= CONV_STD_LOGIC_VECTOR(19,8);	
	wait for 1*clkperiod;
	start	<= '0';
	wait for 1*clkperiod;
	wait for 19*clkperiod;
	--------------------------------------
	start	<= '1';
	A <= CONV_STD_LOGIC_VECTOR(0,8);
	B <= CONV_STD_LOGIC_VECTOR(111,8);	
	wait for 1*clkperiod;
	start	<= '0';
	wait for 1*clkperiod;
	wait for 19*clkperiod;
	--------------------------------------
		start	<= '1';
	A <= CONV_STD_LOGIC_VECTOR(155,8);
	B <= CONV_STD_LOGIC_VECTOR(150,8);	
	wait for 1*clkperiod;
	start	<= '0';
	wait for 1*clkperiod;
	-- reset 	<= '1';
	wait for 5*clkperiod;
	-- reset 	<= '0';
	wait for 19*clkperiod;
	--------------------------------------
		start	<= '1';
	A <= CONV_STD_LOGIC_VECTOR(200,8);
	B <= CONV_STD_LOGIC_VECTOR(150,8);	
	wait for 1*clkperiod;
	start	<= '0';
	wait for 1*clkperiod;
	wait for 19*clkperiod;
	--------------------------------------

	
	assert false
	report "Simulation has done correctly."
	severity failure;
end process;
end Behavioral;
