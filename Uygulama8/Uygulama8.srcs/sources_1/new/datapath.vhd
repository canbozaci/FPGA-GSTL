library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
Port(
	clk 	: in std_logic;
	x_sel	: in std_logic;
	y_sel	: in std_logic;
	x_ld	: in std_logic;
	y_ld	: in std_logic;
	x_neq_y : out std_logic;
	x_lt_y  : out std_logic;
	d_ld    : in std_logic;
	d_o		: out std_logic_vector(31 downto 0);
	x_i 	: in std_logic_vector(31 downto 0);
	y_i 	: in std_logic_vector(31 downto 0)
	);
end datapath;

architecture Behavioral of datapath is
signal o_3 	 : std_logic_vector(31 downto 0):= ( others => '0');
signal o_4 	 : std_logic_vector(31 downto 0):= ( others => '0');
signal o_7 	 : std_logic_vector(31 downto 0):= ( others => '0');
signal o_8 	 : std_logic_vector(31 downto 0):= ( others => '0');
signal o_xld : std_logic_vector(31 downto 0):= ( others => '0');
signal o_yld : std_logic_vector(31 downto 0):= ( others => '0');


begin
process(x_sel,y_sel,clk,o_xld,o_yld) begin
	if (x_sel = '0') then
		o_3 <= x_i;
	else
		o_3 <= o_8;
	end if;
	if (y_sel = '0') then
		o_4 <= y_i;
	else
		o_4 <= o_7;
	end if;
	if ( o_xld /= o_yld) then
		x_neq_y <= '1';
	else
		x_neq_y <= '0';
	end if;
	if 	(o_xld < o_yld) then
		x_lt_y	<= '1';
	else
		x_lt_y	<= '0';
	end if;
	o_8		<= o_xld - o_yld;
	o_7		<= o_yld - o_xld;
	if( rising_edge(clk)) then
		if ( x_ld = '1') then
			o_xld 	<= o_3;
		end if;
		if ( y_ld = '1') then
			o_yld 	<= o_4;
		end if;
		if ( d_ld = '1') then
			d_o <= o_xld;
		end if;
	end if;	
end process;
end Behavioral;