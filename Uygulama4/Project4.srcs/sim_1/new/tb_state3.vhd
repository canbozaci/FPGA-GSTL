library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_state3 is
end tb_state3;

architecture Behavioral of tb_state3 is

component state_3 is
Port ( 
	a 		: in std_logic;
	clk		: in std_logic;
	start	: in std_logic;
	ready	: out std_logic;
	out_p	: out std_logic_vector(7 downto 0)
);
end component;

signal	a 		: std_logic;
signal	clk		: std_logic;
signal	start	: std_logic;
signal	ready	: std_logic;
signal	out_p	: std_logic_vector(7 downto 0);

constant clkperiod	: time	:= 10 ns;

begin
uut: state_3
	PORT MAP (
		a 		 => a, 	
		clk	     => clk,
		start    => start,
		ready    => ready,
		out_p    => out_p
			);
			

CLKGEN : process begin
	clk	<= '1';
	wait for clkperiod/2;
	clk	<= '0';
	wait for clkperiod/2;
	end process;
	
stim_proc: process
	begin
	start <= '1';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	start <= '0';
	a <= '1';
	wait for clkperiod;
	a <= '0';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	a <= '0';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	a <= '0';
	wait for clkperiod;
	-------------------------------------
	start <= '1';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	a <= '0';
	wait for clkperiod;
	start	<= '0';
	a <= '1';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	a <= '0';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	---------------------------------------
	start <= '1';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	a <= '0';
	wait for clkperiod;
	start	<= '0';
	a <= '1';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	a <= '0';
	wait for clkperiod;
	a <= '1';
	wait for clkperiod;
	a <= '0';
	wait for clkperiod;
	a <= '0';
	wait for clkperiod;
	-----------------------------------------
	wait for 10*clkperiod;

	
	assert false
	report "Simulation has done correctly."
	severity failure;
end process;	

end Behavioral;
