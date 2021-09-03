library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity MUL is
Port (
	A : in std_logic_vector (7 downto 0);
	B : in std_logic_vector (7 downto 0);
	C : out std_logic_vector (15 downto 0)
 );
end MUL;

architecture Behavioral of MUL is

begin
	C <= signed(A) * signed (B);

end Behavioral;
