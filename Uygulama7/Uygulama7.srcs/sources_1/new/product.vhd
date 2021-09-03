library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity product is
Port (
	clk 	: in std_logic;
	reset	: in std_logic;
	load 	: in std_logic;
	shift_r : in std_logic;
	datain	: in std_logic_vector(8 downto 0);
	dataout	: out std_logic_vector (15 downto 0)
 );
end product;

architecture Behavioral of product is
signal product_in : std_logic_vector (16 downto 0):=(others => '0');
begin
process(clk) begin
	if(rising_edge(clk)) then 
		if (reset = '1') then
			product_in 	<= ( others => '0');
		elsif( load = '1') then
			product_in(15 downto 7) <= datain;
		elsif( shift_r = '1') then
			product_in	<= std_logic_vector(unsigned(product_in) srl 1);
		end if;
			dataout		<= product_in(15 downto 0);
	end if;
end process;
end Behavioral;