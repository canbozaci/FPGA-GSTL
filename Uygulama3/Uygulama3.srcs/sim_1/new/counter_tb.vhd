library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity counter_tb is

end counter_tb;

architecture Behavioral of counter_tb is
	component counter is
		Port(
			clk 	: in std_logic;
			leds 	: out std_logic_vector(7 downto 0);
			SW 		: in std_logic;
			button 	: in std_logic;
			reset 	: in std_logic);
	end component;

	
	signal 		clk 		: std_logic;
	signal 		leds 		: std_logic_vector(7 downto 0):= x"00";
	signal 		SW 			: std_logic:= '1';
	signal 		button		: std_logic:= '0';
	signal 		reset 		: std_logic:= '1';
	constant	clkperiod	: time	:= 10 ns;
	constant 	butonbas 	: time := 2 ms;
	
begin
	uut: counter
	-- GENERIC MAP(
		-- c_clkfreq => c_clkfreq
		-- )
	PORT MAP (
		clk 	=> clk,
		leds	=> leds,
		SW 		=> SW,
		button 	=> button,
		reset 	=> reset
			);

CLKGEN : process begin
	clk	<= '1';
	wait for clkperiod/2;
	clk	<= '0';
	wait for clkperiod/2;
	end process;
	

stim_proc: process
	begin
	Reset 	<= '1';
	wait for 1 ms;
	Reset 	<= '0';
	wait for 1 ms;
	Button 	<= '1';
	wait for 4*butonbas;
	Button  <= '0';
	wait for 2*butonbas;
	Button 	<= '1';
	wait for 4*butonbas;
	SW		<= '1';
	Button  <= '0';
	wait for butonbas;
	-- Reset 	<= '1';
	-- wait for 20ns;
	-- Reset 	<= '0';
	-- wait for 20ns ;
	Button 	<= '1';
	wait for butonbas/50;
	Button  <= '0'; 
	wait for butonbas/50;	
	Button 	<= '1';	
	wait for butonbas;	
	Button  <= '0'; 	
	wait for butonbas;	
	Button 	<= '1';	
	wait for butonbas;	
	Button  <= '0'; 	
	wait for butonbas;	
	Button 	<= '1';	
	wait for butonbas;	
	Button  <= '0';
	SW 		<= '0'; 	
	wait for butonbas;	
	Button 	<= '1';	
	wait for butonbas;	
	Button  <= '0'; 	
	wait for butonbas;	
	Button 	<= '1';	
	wait for butonbas;	
	Button  <= '0'; 	
	wait for butonbas;	
	Button 	<= '1';	
	wait for butonbas;	
	Button  <= '0'; 	    	
	wait for butonbas;
	assert false
	report "Simulation has done correctly."
	severity failure;
	end process;
	
	end Behavioral;
