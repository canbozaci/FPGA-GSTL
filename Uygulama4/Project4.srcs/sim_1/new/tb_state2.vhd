library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity tb_state2 is
end tb_state2;

architecture Behavioral of tb_state2 is

component state_2 is
Port ( 
	datain	: in 	std_logic;
	clk	 	: in 	std_logic;
	dataout	: out	std_logic
);
end component;

signal datain: std_logic:='0';
signal clk: std_logic;
signal dataout: std_logic;

constant	clkperiod	: time	:= 10 ns;

begin
uut: state_2
	PORT MAP (
		datain 		=> datain,
		clk			=> clk,
		dataout 	=> dataout
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
	datain <= '1';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '0';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '0';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '1';
	------ ilk dogru
	wait for clkperiod;
	datain <= '0';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '0';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	------- ikinci dogru
	datain <= '0';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '0';
	----
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '0';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '0';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '1';
	wait for clkperiod;
	datain <= '1';
	-----
	

	
	assert false
	report "Simulation has done correctly."
	severity failure;
end process;	

end Behavioral;
