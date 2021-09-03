
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;

entity FA_tb is -- testbench top declaration
--  Port ( );
end FA_tb;

architecture Behavioral of FA_tb is
    
    -- Component Declaration for the Unit Under Test (UUT)
    component full_adder
        Port ( a_i 			: in STD_LOGIC;
               b_i 			: in STD_LOGIC;
               carry_i 		: in STD_LOGIC;
               sum_o 		: out STD_LOGIC;
               carry_o	 	: out STD_LOGIC);
    end component; 
    
    --input signals - with initial values
    signal a_i,b_i,carry_i : std_logic := '0';
    --output signals
    signal sum_o: std_logic;
    signal carry_o :std_logic;
    
begin
    
     uut: full_adder PORT MAP (
     a_i 			=> a_i,
     b_i 			=> b_i,
     carry_i		=> carry_i,
     sum_o			=> sum_o,
     carry_o 		=> carry_o  );
    
     -- Stimulus process
     stim_proc: process
     begin
         -- hold reset state for 100 ns.
        
         -- insert stimulus here
         a_i		<= '1';
         b_i		<= '1';
         carry_i 	<= '1';
         wait for 10 ns;
         a_i		<= '1';
         b_i		<= '1';
         carry_i 	<= '0';
         wait for 10 ns;
         a_i		<= '1';
         b_i		<= '0';
         carry_i 	<= '0';
         wait for 10 ns;
         a_i		<= '1';
         b_i		<= '0';
         carry_i 	<= '1';
         wait for 10 ns;
         a_i		<= '0';
         b_i		<= '1';
         carry_i 	<= '1';
         wait for 10 ns;
         a_i		<= '0';
         b_i		<= '1';
         carry_i 	<= '0';
         wait for 10 ns;
         a_i		<= '0';
         b_i		<= '0';
         carry_i 	<= '1';
         wait for 10 ns;
         a_i		<= '0';
         b_i		<= '0';
         carry_i 	<= '0';
         wait for 10 ns;
         
         --wait;
         finish(0);
         
    end process;


end Behavioral;
