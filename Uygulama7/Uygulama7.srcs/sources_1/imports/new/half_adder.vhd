library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity half_adder is
Port ( 
-- inputs _i stands for input
a_i 		: in std_logic;
b_i 		: in std_logic;
-- outputs _o stands for output
sum_o 		: out std_logic;
carry_o 	: out std_logic
);
end half_adder;

architecture Behavioral of half_adder is

begin

sum_o		<= a_i xor b_i;
carry_o		<= a_i and b_i;

end Behavioral;
