library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity counter is
	Port(	
		clk 		: in std_logic;
		leds 		: out std_logic_vector(7 downto 0);
		SW 			: in std_logic;
		button 		: in std_logic;
		reset 		: in std_logic
	);
	end counter;

architecture Behavioral of counter is
	component rc_adder is
		generic (
			N	: integer := 8
				); 
		port(
			a_i			: in std_logic_vector (7 downto 0); -- N-1 olcak!
			b_i			: in std_logic_vector (7 downto 0);
			carry_i		: in std_logic;
			sum_o		: out std_logic_vector (7 downto 0);
			carry_o		: out std_logic
			);	
	end component;

	-- CONSTANT
	constant clk_counter	: integer := 1000; -- 1000 katı daha yavaş 
	--	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	--
	-- SIGNAL DEF
	signal  c_i 				: std_logic := '0';
	signal  c_o 				: std_logic;
	signal 	a_i					: std_logic_vector(7 downto 0):= x"00";
	signal 	b_i 				: std_logic_vector(7 downto 0):= x"01"; 
	signal 	sum_o 				: std_logic_vector(7 downto 0);
	signal 	temp 				: std_logic_vector(7 downto 0);
	signal 	timerlim			: integer := clk_counter;
	signal 	timer				: integer range 0 to clk_counter := 0;	
	signal 	clk_new				: std_logic :='0';
	 --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	--
	--- TYPE DEF
	type t_state is (S_IDLE, S_UPDATE, S_REFRESH,S_RESET);
	signal state : t_state := S_IDLE;
	--	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	-- --	--	--
begin
 counterr: rc_adder 
	port map( 
		a_i 	=> a_i,
		b_i		=> b_i,
		carry_i => c_i,
		sum_o	=> sum_o,
		carry_o => c_o
			);


process (clk_new)
begin
if(rising_edge(clk_new)) then

	case state is
	WHEN S_IDLE =>
		if (reset = '1') then		
		state 				<= S_reset;
		elsif(button = '1') then
		state				<= S_UPDATE;
		else
		state				<= S_IDLE;
		end if;
	WHEN S_UPDATE =>
		if(SW = '1') then
		a_i					<= sum_o;
		leds			  	<= sum_o;
		temp				<= sum_o;
		state				<= S_REFRESH;
		else
		temp 			 	<= temp - '1';
		leds 				<= temp - '1';
		a_i 			 	<= temp - '1';
		state				<= S_REFRESH;
		end if;
	WHEN S_REFRESH =>
		if (button = '1') then
		state 		<= S_REFRESH;
		else
		state		<= S_IDLE;
		end if;
	WHEN S_RESET   =>
		leds			 	<= x"00";
		a_i				 	<= x"00";
		temp			 	<= x"00";
		if ( Reset = '1') then
		state				<= S_RESET;
		else
		state				<= S_IDLE;
		end if;
	end case;
end if;
end process;

process (clk) begin
if (rising_edge(clk)) then

	if (timer >= timerlim-1) then
		timer		<= 0;
		clk_new 	<= not clk_new;	
	else
		timer 		<= timer + 1;
	end if;

end if;
end process;
end Behavioral;
