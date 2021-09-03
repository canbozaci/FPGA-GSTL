


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_state2 is
--  Port ( );
end tb_state2;

architecture Behavioral of tb_state2 is

component state_2 is
	Port ( 
	clk 	: in std_logic;
	lr_1 	: in std_logic;
	kr_50	: in std_logic;
	kr_25	: in std_logic;
	su		: out std_logic
		);
end component;

signal clk 		: std_logic:='0';
signal lr_1 	: std_logic:='0';
signal kr_50	: std_logic:='0';
signal kr_25	: std_logic:='0';
signal su 		: std_logic:='0';

constant	clk_period	: time	:= 10 ns;


begin
	uut: state_2
	PORT MAP (
		clk 		=> clk,
		lr_1		=> lr_1,
		kr_50 		=> kr_50,
		kr_25		=> kr_25,
		su 			=> su
			);
			
CLKGEN : process begin
	clk	<= '1';
	wait for clk_period/2;
	clk	<= '0';
	wait for clk_period/2;
	end process;
	
stim_proc: process
	begin
	wait for clk_period;
	lr_1	<= '1';
	wait for 2*clk_period;
	lr_1	<= '0';
	kr_50	<= '1';
	wait for 2*clk_period;
	lr_1	<= '1';
	kr_50 	<= '0';
	wait for 2*clk_period;
	kr_50	<= '1';
	lr_1	<= '0';
	wait for 2*clk_period;
	kr_50 	<= '0';
	lr_1	<= '1';
	wait for 2*clk_period;
	lr_1	<= '0';
	kr_50	<= '0';
	kr_25 	<= '1';
	wait for 2*clk_period;
	lr_1	<= '1';
	wait for 2*clk_period;
	lr_1	<= '0';
	wait for 20*clk_period;
	
	
	assert false
	report "Simulation has done correctly."
	severity failure;
end process;


end Behavioral;
