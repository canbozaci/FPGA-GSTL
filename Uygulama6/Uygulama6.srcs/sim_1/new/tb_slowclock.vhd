library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_slowclock is
--  Port ( );
end tb_slowclock;

architecture Behavioral of tb_slowclock is
component slow_clock is
	Port(	
		clk 		: in std_logic;
		clk_n		: out std_logic
	);
end component;
	signal clk : std_logic;
	signal clk_n : std_logic;
	signal clk_period : time := 20 ns;
	
begin
UUT : slow_clock
port map(
		clk			=> clk,
		clk_n		=> clk_n	
		);

CLKGEN : process begin
	clk	<= '0';
	wait for clk_period/2;
	clk	<= '1';
	wait for clk_period/2;
	end process;
	
P_STIMULI : process begin

	wait for 2000 ms;

end process;
end Behavioral;
