library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity controller is
 Port (
	clk						: in std_logic;
	reset 					: in std_logic;
	start 					: in std_logic;
	load_multiplier 		: out std_logic;
	shift_multiplier 		: out std_logic;
	load_multiplicand		: out std_logic;
	reset_product 			: out std_logic;
	load_product 			: out std_logic;	
	shift_product 			: out std_logic;
	ready					: out std_logic
 );
end controller;

architecture Behavioral of controller is
signal ready_q : std_logic:='0';
signal counter: integer :=0;
type controller_state is (S_0, S_1, S_2,S_3);
signal state : controller_state := S_0;

begin
process (clk,reset) begin
if(reset = '1') then
		state <= S_0;
		load_multiplier 	<= '0';
		load_multiplicand 	<= '0';
		reset_product		<= '0';
		counter				<= 	0 ;
		load_product		<= '0';
		shift_multiplier	<= '0';
		shift_product		<= '0';
		ready				<= '0';
elsif(rising_edge(clk)) then
case state is
	WHEN S_0 =>
	if(ready_q = '1') then
		ready				<= '0';
		ready_q				<= '0';
		shift_multiplier	<= '0';
		shift_product		<= '0';
		load_product		<= '0';
		load_multiplier		<= '0';			
		load_multiplicand 	<= '0';
		reset_product		<= '0';
		counter				<=  0 ;
		state 				<= S_0;
	end if;
	ready				<= '0';
	shift_multiplier	<= '0';
	shift_product		<= '0';
	load_product		<= '0';
	load_multiplier		<= '1';			
	load_multiplicand 	<= '1';
	reset_product		<= '1';
	counter				<=  0 ;
	
	if (start = '1') then
		state			<= S_1;
	else 
		state 			<= S_0;
	end if;
-------------	-------------	-------------	-------------	-------------	------------
	WHEN S_1 =>
	shift_multiplier	<= '0';
	shift_product		<= '0';
	load_multiplier		<= '0';
	load_multiplicand 	<= '0';
	reset_product		<= '0';
	load_product		<= '1';
	
	counter		 		<= counter + 1;
	state		 		<= S_2;
-------------	-------------	-------------	-------------	-------------	------------	
	WHEN S_2 =>
	shift_multiplier	<= '1';
	shift_product		<= '1';
	load_multiplier		<= '0';
	load_multiplicand 	<= '0';
	reset_product		<= '0';
	load_product		<= '0';
	
	if (counter = 8) then
		state 			<= S_3;
	else
		state 			<= S_1;
	end if;
-------------	-------------	-------------	-------------	-------------	------------
	WHEN S_3 =>
	shift_multiplier	<= '0';
	shift_product		<= '0';	
	load_multiplier		<= '0';
	load_multiplicand 	<= '0';
	reset_product		<= '0';
	load_product		<= '0';
	
	ready_q				<= '1';
	ready 				<= '1';
	state 				<= S_0;
end case;
end if;
end process;	
end Behavioral;



