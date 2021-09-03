
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_state1 is
end tb_state1;

architecture Behavioral of tb_state1 is

component state_1 is
Port ( 
	clk 	: in std_logic;
	reset 	: in std_logic;
	r1		: out std_logic;
	r2		: out std_logic;
	y1		: out std_logic;
	y2		: out std_logic;
	g1		: out std_logic;
	g2		: out std_logic
);
end component;


signal clk	: std_logic;
signal reset: std_logic:='0';
signal r1 	: std_logic:='0';
signal r2 	: std_logic:='0';
signal y1 	: std_logic:='0';
signal y2 	: std_logic:='0';
signal g1 	: std_logic:='0';
signal g2 	: std_logic:='0';

constant	clkperiod	: time	:= 1 sec;

begin
uut: state_1
	PORT MAP (
		clk 		=> clk,
		reset		=> reset,
		r1 			=> r1,
		r2 			=> r2,
		y1 			=> y1,
		y2 			=> y2,
		g1 			=> g1,
		g2 			=> g2
			);
			

CLKGEN : process begin
	clk	<= '1';
	wait for clkperiod/2;
	clk	<= '0';
	wait for clkperiod/2;
	end process;
	
stim_proc: process
	begin
	wait for 100*clkperiod;
	
	wait for 48*clkperiod;
	reset <= '1';
	wait for 2*clkperiod;
	reset <= '0';
	wait for 500*clkperiod;
	
	assert false
	report "Simulation has done correctly."
	severity failure;
	
end process;
end Behavioral;
