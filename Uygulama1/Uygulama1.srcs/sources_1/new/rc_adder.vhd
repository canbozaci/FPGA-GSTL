library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rc_adder is
generic (
N	: integer := 8
); 
port(
a_i			: in std_logic_vector (N-1 downto 0); -- N-1 olcak!
b_i			: in std_logic_vector (N-1 downto 0);
carry_i		: in std_logic;
sum_o		: out std_logic_vector (N-1 downto 0);
carry_o		: out std_logic
);	
end rc_adder;

architecture Behavioral of rc_adder is

component full_adder is
port ( 
--inputs
a_i 		: in std_logic;
b_i 		: in std_logic;
carry_i 	: in std_logic;
--outputs
sum_o 		: out std_logic;
carry_o		: out std_logic
);
end component;
signal c_temp	: std_logic_vector (N downto 0)	:= (others => '0'); -- creating temporary signal for carry because its normally output and has to be input for next one
-- c_temp is not N-1 downto 0 , its N downto 0 !!

begin

c_temp(0)	<= carry_i; -- LSB of c_temp is equal to carry input
carry_o		<= c_temp(N); -- carry_o is equal to MSB of c_temp

FULL_ADDER_GEN: for k in 0 to N-1 generate --
	full_adder_k : full_adder
	port map( 
	a_i 	=> a_i(k),
	b_i 	=> b_i(k),
	carry_i => c_temp(k),
	sum_o 	=> sum_o(k),
	carry_o => c_temp(k+1) -- at finish carry_o is equal to c_temp(N)
	);
end generate;


end Behavioral;
