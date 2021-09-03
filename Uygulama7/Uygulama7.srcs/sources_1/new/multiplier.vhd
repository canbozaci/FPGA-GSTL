library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity multiplier is
 Port(
	clk 	: in std_logic;
	A		: in std_logic_vector(7 downto 0);
	load	: in std_logic;
	shift_r	: in std_logic;
	dataout : out std_logic
	);
end multiplier;

architecture Behavioral of multiplier is
			
--------------- Signal Declerations ------------------------------------------------------------------------------------
signal a_temp	: std_logic_vector(7 downto 0):= ( others => '0');
------------------------------------------------------------------------------------------------------------------------
begin

process (clk) begin
if(rising_edge(clk)) then
	if ( load = '1') then
		a_temp	<= A;
	elsif ( shift_r = '1') then
		a_temp	<= std_logic_vector(unsigned(a_temp) srl 1 );
	end if;		
end if;
end process;
	dataout	<= a_temp(0);
end behavioral;