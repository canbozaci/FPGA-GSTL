library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;



entity ADD is
Port (
	A : in std_logic_vector (15 downto 0);
	B : in std_logic_vector (15 downto 0);
	C : out std_logic_vector (15 downto 0)
 );
end ADD;

architecture Behavioral of ADD is

begin
C <= signed(A) + signed(B);

end Behavioral;
