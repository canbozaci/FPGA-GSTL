
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity timer is
generic (
	clkfreq_sys		: integer := 100_000_000;
	clkfreq_spe		: integer := 1_000_000
);
Port (
	clk 	: in	std_logic;
	clk_o	: out 	std_logic
);
end timer;

architecture Behavioral of timer is

signal   clk_ctr		: integer:= 0;
signal	 c_temp			: std_logic;
constant c_edgecntrlim	: integer := (clkfreq_sys/(clkfreq_spe));

begin
CLK_GEN : process(clk) begin
if (rising_edge(clk)) then
	if clk_ctr = 2*(c_edgecntrlim-1) then
			c_temp 		<= not c_temp;
			clk_ctr		<= 0;
			clk_o		<= c_temp;
		else
			clk_ctr	<= clk_ctr + 1;
	end if;
end if;
end process;
end Behavioral;
