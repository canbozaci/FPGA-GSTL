library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity controller is
 Port(
	clk     : in std_logic;
	go_i	: in std_logic;
	x_sel	: out std_logic;
	y_sel	: out std_logic;
	x_ld	: out std_logic;
	y_ld	: out std_logic;
	x_neq_y : in std_logic;
	x_lt_y  : in std_logic;
	d_ld    : out std_logic
	);
end controller;

architecture Behavioral of controller is


type controller_state is (S_0000, S_0001, S_0010,S_0011, S_0100, S_0101, S_0110, S_0111, 
S_1000, S_1001, S_1010,S_1011, S_1100);
signal state : controller_state := S_0000;


begin
process (clk) begin
if(rising_edge(clk)) then
case state is
	WHEN S_0000 =>
		state 	<= S_0001;
	WHEN S_0001 =>
		if ( go_i = '1') then
			state <= S_0011;
		else
			state <= S_0010;
		end if;	
	WHEN S_0010 =>
		state <= S_0001;
		
	WHEN S_0011 =>
		x_sel <= '0';
		x_ld  <= '1';
		state <= S_0100;
		
	WHEN S_0100 =>
		x_ld  <= '0';
		
		y_sel <= '0';
		y_ld  <= '1';
		state <= S_0101;
		
	WHEN S_0101 =>
		
		if ( x_neq_y = '1') then
		state <= S_0110;
		else
		state <= S_1011;
		end if;
		
	WHEN S_0110 =>
		
		if ( x_neq_y = '0') then
		state <= S_1011;
		elsif ( x_lt_y= '1') then
		state <= S_0111;
		else
		state <= S_1000;
		end if;
		
	WHEN S_0111 =>
		y_sel <= '1';
		y_ld  <= '1';
		state <= S_1001;
		
	WHEN S_1000 =>
		x_sel <= '1';
		x_ld  <= '1';
		state <= S_1001;
		
	WHEN S_1001 =>
		state <= S_1010;
		y_ld  <= '0';
		x_ld  <= '0';
	WHEN S_1010 =>
		
		if ( x_neq_y = '0') then
		state <= S_1011;
		else 
		state <= S_0101;
		end if;
		
	WHEN S_1011 =>
		d_ld  <= '1';
		state <= S_1100;
	WHEN S_1100 =>
		d_ld  <= '0';
		state <= S_0000;


end case;

end if;
end process;
end Behavioral;
