library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity state_2 is
Port ( 
	clk 	: in std_logic;
	lr_1 	: in std_logic;
	kr_50	: in std_logic;
	kr_25	: in std_logic;
	su		: out std_logic
);
end state_2;

architecture Behavioral of state_2 is

signal m_total : integer 	:= 0; -- lr1 => 100, kr_50 => 50, kr_25 => 25
signal su_temp : std_logic	:='1';

type q2_state is (S_IDLE, S_UPDATE);
signal state : q2_state := S_IDLE;


begin
process (clk)
begin
if(rising_edge(clk)) then
case state is
	when S_IDLE =>
		if (su_temp = '1') then
			su 		<= '0';
		end if;
		if(lr_1 = '1') then
			m_total <= m_total + 100;
			state 	<= S_UPDATE;
			su_temp <= '0';
		elsif(kr_50 = '1') then
			m_total <= m_total + 50;
			state 	<= S_UPDATE;
			su_temp <= '0';
		elsif(kr_25 = '1') then
			m_total <= m_total + 25;
			state 	<= S_UPDATE;
			su_temp <= '0';
		else 
			state	<= S_IDLE;
			su_temp <= '0';
		end if;
	when S_UPDATE =>
		if (m_total >= 100) then
			su 		<= '1';
			state 	<= S_IDLE;
			su_temp <= '1';
			m_total	<= 0;
		else
			state	<= S_IDLE;
		end if;
end case;
end if;			
end process;
end Behavioral;
