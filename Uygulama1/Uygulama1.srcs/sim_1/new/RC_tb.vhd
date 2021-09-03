
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;

entity RC_tb is -- testbench top declaration
generic(
N : integer := 8 -- burda tanımlamazsan N'i görmüyor bu yüzden aşağıda tanımlasan bile yukarıda tekrar tanımlaman gerekiyor
);
end RC_tb;

architecture Behavioral of RC_tb is
    
	component rc_adder is
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
	end component;
    
    --input signals - with initial values
    signal a_i,b_i : std_logic_vector (N-1 downto 0) := x"00";
	signal carry_i : std_logic := '0';
    --output signals
    signal sum_o: std_logic_vector (N-1 downto 0);
    signal carry_o :std_logic;
    
begin
    
     uut: rc_adder  PORT MAP (
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
         a_i		<= x"11";
         b_i		<= x"11";
         carry_i 	<= '0';
         wait for 10 ns;
		 a_i		<= x"FF";
         b_i		<= x"FF";
         carry_i 	<= '1';
         wait for 10 ns;
		 a_i		<= x"15";
         b_i		<= x"38";
         carry_i 	<= '0';
         wait for 10 ns;
		 a_i		<= x"57";
         b_i		<= x"AB";
         carry_i 	<= '1';
         wait for 10 ns;
		 a_i		<= x"CC";
         b_i		<= x"DF";
         carry_i 	<= '0';
         wait for 10 ns;
		 a_i		<= x"14";
         b_i		<= x"00";
         carry_i 	<= '1';
         wait for 10 ns;
		  a_i		<= x"00";
         b_i		<= x"00";
         carry_i 	<= '0';
         wait for 10 ns;
		 
         
         --wait;
         finish(0);
         
    end process;


end Behavioral;
