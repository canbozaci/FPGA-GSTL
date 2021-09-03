library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder is
port ( 
--inputs
a_i 		: in std_logic;
b_i 		: in std_logic;
carry_i 	: in std_logic;
--outputs
sum_o 		: out std_logic;
carry_o		: out std_logic
);
end full_adder;

architecture Behavioral of full_adder is
component half_adder is
port ( 
--inputs
a_i 		: in std_logic;
b_i 		: in std_logic;
--outputs
sum_o 		: out std_logic;
carry_o		: out std_logic
);
end component half_adder;

signal f_sum	: std_logic := '0'; -- first sum
signal f_carry	: std_logic := '0'; -- first carry
signal s_carry	: std_logic := '0'; -- second carry

begin

f_half_adder : half_adder
port map( 
a_i 		=> a_i,
b_i 		=> b_i,
sum_o 		=> f_sum,
carry_o 	=> f_carry
);

s_half_adder : half_adder
port map( 
a_i 		=> f_sum,
b_i 		=> carry_i,
sum_o	 	=> sum_o,
carry_o 	=> s_carry
);

carry_o	<= f_carry or s_carry;
end Behavioral;
