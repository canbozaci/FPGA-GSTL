
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_state1 is
generic ( 
N			: integer := 4
);
end tb_state1;

architecture Behavioral of tb_state1 is
	component state_1 is
	Generic(
		N			: integer := 4
			);	
	Port( 
		a 			: in std_logic_vector(N-1 downto 0);
		b 			: in std_logic_vector(N-1 downto 0);
		d 			: in std_logic;
		x			: out std_logic_vector(N-1 downto 0);
		clk 		: in std_logic;
		reset 		: in std_logic
		);
	end component;
	
	-- signal		N			: integer:= 1;
	
	signal 		d	 		: std_logic:= '0';
	signal 		x 			: std_logic_vector(N-1 downto 0):= x"0";
	signal 		a 			: std_logic_vector(N-1 downto 0):= x"0";
	signal 		b			: std_logic_vector(N-1 downto 0):= x"0";
	signal 		clk 		: std_logic:= '0';
	signal 		reset 		: std_logic:= '0';
	
	
	constant	clkperiod	: time	:= 10 ns;
begin
uut: state_1
	GENERIC MAP(
		N => N
		)
	PORT MAP (
		a 		=> a,
		b		=> b,
		d 		=> d,
		x 		=> x,
		reset 	=> reset,
		clk		=> clk
			);
			

CLKGEN : process begin
	clk	<= '1';
	wait for clkperiod/2;
	clk	<= '0';
	wait for clkperiod/2;
	end process;
	

stim_proc: process
	begin
	wait for clkperiod;
	a		<= x"d";
	d 		<= '0';
	wait for clkperiod;
	b		<= x"b";
	d 		<= '1';
	wait for clkperiod;
	reset 	<= '1';
	wait for clkperiod;
	reset 	<= '0';
	a		<= x"c";
	b		<= x"a";
	wait for clkperiod;
	d		<= '1';
	a		<= x"F";
	wait for clkperiod;
	wait for clkperiod;
	assert false
	report "Simulation has done correctly."
	severity failure;
end process;
end Behavioral;
