library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity state_3 is
Port (
	a 		: in std_logic;
	clk		: in std_logic;
	start	: in std_logic;
	ready	: out std_logic;
	out_p	: out std_logic_vector(7 downto 0)
 );
end state_3;

architecture Behavioral of state_3 is

signal temp 	: std_logic_vector(7 downto 0):="00000000";
signal counter  : integer:= 1;

type q3_state is (S_IDLE, S_UPDATE);
signal state : q3_state := S_IDLE;


begin
process (clk)
begin
if(rising_edge(clk)) then
case state is
	WHEN S_IDLE =>
		ready 	<= '0';
		counter <= 	1 ;
		temp	<= "00000000";
	if( start = '1') then
		state 	<= S_UPDATE;
		temp(0) <= a;
	else
		state <= S_IDLE;
	end if;
	when S_UPDATE =>
	if ( counter <= 7 ) then
		temp(counter) 	<= a;
		counter 		<= counter + 1;
		state 			<= S_UPDATE;
	else
		counter <= 1;
		ready	<= '1';
		out_p 	<= temp;
		STATE 	<= S_IDLE;
	end if;
	end case;
end if;
end process;	
end Behavioral;
