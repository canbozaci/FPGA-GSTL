library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity slow_clock is
Port(	
		clk 		: in std_logic;
		clk_n		: out std_logic
	);
end slow_clock;

architecture Behavioral of slow_clock is

	constant clk_counter	: integer := 1_000_000; 
	
	signal timerlim			: integer := clk_counter/2;
	signal clk_new			: std_logic:= '0';
	signal timer			: integer:=0;
	
begin
process (clk) begin
if (rising_edge(clk)) then

	if (timer >= timerlim-1) then
		timer		<= 0;
		clk_new 	<= not clk_new;	
	else
		timer 		<= timer + 1;
	end if;
end if;

clk_n	<= clk_new;
end process;

end Behavioral;
