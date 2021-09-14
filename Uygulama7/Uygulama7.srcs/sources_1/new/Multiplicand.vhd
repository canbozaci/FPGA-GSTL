library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplicand is
    Port ( 
    clk		: in std_logic;
    dataout : out std_logic_vector(7 downto 0);
    B		: in std_logic_vector(7 downto 0);
    load 	: in std_logic);

end Multiplicand;

architecture Behavioral of Multiplicand is
signal b_temp : std_logic_vector(7 downto 0):= ( others => '0');
begin

process (clk) begin
	if (rising_edge(clk)) then
		if ( load = '1') then
		b_temp <= B;
		end if;
	end if;
end process;
dataout	<= b_temp;
end Behavioral;
