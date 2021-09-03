library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity deneme2 is
Port ( 
	clk 	: in std_logic;
	lr_1 	: in std_logic;
	kr_50	: in std_logic;
	kr_25	: in std_logic;
	para_u	: out integer;
	su		: out std_logic
);
end deneme2;

architecture Behavioral of deneme2 is

 -- lr1 => 100, kr_50 => 50, kr_25 => 25
signal m_total : integer 	:= 0;
signal su_temp : std_logic	:='1';
signal m_total_current : integer := 0;

type q2_state is (S_IDLE);
signal state : q2_state := S_IDLE;


begin
process (clk,m_total)
begin
if(rising_edge(clk)) then
case state is
	when S_IDLE =>
		state	<= S_IDLE;		
		para_u	<= 0;
		m_total_current	<= m_total;		
		if (su_temp = '1') then
			su 		<= '0';
		end if;		
		su_temp <= '0';
		if(lr_1 = '1' and kr_50 = '1' and kr_25 = '1') then
			m_total <= m_total + 175;
		elsif(lr_1 = '1' and kr_50 = '1' and kr_25 = '0') then
			m_total <= m_total + 150;		
		elsif(lr_1 = '1' and kr_50 = '0' and kr_25 = '1') then
			m_total <= m_total + 125;
		elsif(lr_1 = '1' and kr_50 = '0' and kr_25 = '0') then
			m_total <= m_total + 100;
		elsif(lr_1 = '0' and kr_50 = '1' and kr_25 = '1') then
			m_total <= m_total + 75;
		elsif(lr_1 = '0' and kr_50 = '1' and kr_25 = '0') then
			m_total <= m_total + 50;
		elsif(lr_1 = '0' and kr_50 = '0' and kr_25 = '1') then
			m_total <= m_total + 25;
		end if;		
end case;
end if;

if(m_total >= 100) then
	su 			<= '1';	
	su_temp 	<= '1';
	m_total		<= 0;
	para_u		<= m_total - 100;
	m_total_current <= m_total;
end if;		
	
end process;



end Behavioral;
