library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity state_1 is
Generic(
	N			: integer := 4
);	
Port ( 
	a 			: in std_logic_vector(N-1 downto 0);
	b 			: in std_logic_vector(N-1 downto 0);
	d 			: in std_logic;
	x			: out std_logic_vector(N-1 downto 0);
	clk 		: in std_logic;
	reset 		: in std_logic
);
end state_1;

architecture Behavioral of state_1 is



--- TYPE DEF
type q1_state is (State_A, State_B);
signal state : q1_state := State_A;
--	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	--
begin
process (clk)
begin
if(rising_edge(clk)) then
	case state is
	WHEN State_A =>
		if (reset = '1') then
			state		<= State_A;
			x			<= a;
		elsif( d= '0') then
			state 		<= State_A;
			x			<= a;
		elsif (d= '1') then
			state		<= State_B;
			x 			<= b;
		end if;
	WHEN State_B =>
		if ( reset = '1') then
			state		<= State_A;
			x			<= a;
		elsif( d= '0') then
			state 		<= State_B;
			x			<= b;
		elsif (d= '1') then
			state		<= State_A;
			x			<= a;
		end if;
	end case;
end if;
end process;

end Behavioral;
