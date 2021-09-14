
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity logic_s is
generic (
N	: integer := 32;
H 	: integer := 4
); 
Port (
  A 	: in 	unsigned(N-1 downto 0);
  CNT 	: in 	std_logic;	
  B 	: in 	unsigned(H-1 downto 0);
  D 	: out 	std_logic_vector(N-1 downto 0)
 );
end logic_s;

architecture Behavioral of logic_s is
signal shifter: integer;

begin  
    process (CNT,a,b,shifter)
    begin   
	shifter <= to_integer(unsigned(B));
	if (CNT = '0') then 
	 D <= std_logic_vector(a sll shifter);
     else
     D <= std_logic_vector(a srl shifter);
     end if;  
    end process;
	



end Behavioral;