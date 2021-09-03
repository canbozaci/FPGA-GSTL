library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity state_2 is
Port ( 
	datain	: in 	std_logic;
	clk	 	: in 	std_logic;
	dataout	: out	std_logic
);
end state_2;

architecture Behavioral of state_2 is

signal correct 	: std_logic_vector(6 downto 0):= "1101011";
signal counter	: integer:= 6;

type q2_state is (S_IDLE, S_CHECK);
signal state : q2_state := S_IDLE;

begin
process (clk)
begin
if(rising_edge(clk)) then
	case state is
	when S_IDLE =>
			dataout <= '0';
			counter <= 6;
		if ( datain = correct(6)) then
			state <= S_CHECK;
		else
			state <= S_IDLE;
		end if;
	WHEN S_CHECK =>
		if ( datain = correct(counter-1) ) then
			state 	<= S_CHECK;
			counter <= counter - 1;
		else
			STATE <= S_IDLE;
		end if;
		if(counter = 1) then
			dataout <= '1';
			state <= S_IDLE;
		end if;
		end case;
end if;
end process;
end Behavioral;
