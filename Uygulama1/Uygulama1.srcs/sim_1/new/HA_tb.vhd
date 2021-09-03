
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;

entity HA_tb is -- testbench top declaration
--  Port ( );
end HA_tb;

architecture Behavioral of HA_tb is
    
    -- Component Declaration for the Unit Under Test (UUT)
    component half_adder
		Port ( 
		-- inputs _i stands for input
		a_i 		: in std_logic;
		b_i 		: in std_logic;
		-- outputs _o stands for output
		sum_o 		: out std_logic;
		carry_o 	: out std_logic
		);
	end component;
    
    --input signals - with initial values
    signal a_i,b_i: std_logic := '0';
    --output signals
    signal sum_o: std_logic;
    signal carry_o :std_logic;
    
begin
    
     uut: half_adder PORT MAP (
     a_i 			=> a_i,
     b_i 			=> b_i,
     sum_o			=> sum_o,
     carry_o 		=> carry_o  );
    
     -- Stimulus process
     stim_proc: process
     begin
         -- hold reset state for 100 ns. 
      
         -- insert stimulus here
         a_i		<= '1';
         b_i		<= '1';
         wait for 10 ns;
         a_i		<= '1';
         b_i		<= '0';
         wait for 10 ns;
         a_i		<= '0';
         b_i		<= '1';
         wait for 10 ns;
         a_i		<= '0';
         b_i		<= '0'; 
         wait for 10 ns;     
         --wait;
         finish(0);
         
    end process;


end Behavioral;
