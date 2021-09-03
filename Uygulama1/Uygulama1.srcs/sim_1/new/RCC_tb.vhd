
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;

entity RCC_tb is -- testbench top declaration
generic(
N  : integer := 8;
B  : integer := 17;
O  : integer := 2**(17)
);
end RCC_tb;

architecture Behavioral of RCC_tb is
    
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
    signal a_i,b_i : std_logic_vector (N-1 downto 0) := (others => '0');
	signal carry_i : std_logic := '0';
	
    --output signals
    signal sum_o: std_logic_vector (N-1 downto 0);
    signal carry_o :std_logic;
	-- extras
	signal c_limit : integer := O;
	signal hepsi   : std_logic_vector (B-1 downto 0):= (others => '0');
	signal counter : integer :=0;
	signal awe	   : integer;
	signal l 	   : integer;
    
begin
    
     uut: rc_adder  PORT MAP (
     a_i 			=> a_i,
     b_i 			=> b_i,
     carry_i		=> carry_i,
     sum_o			=> sum_o,
     carry_o 		=> carry_o  );
    
     stim_proc: process
	     begin
		 awe 		<= 0;
		 l			<= 1;
		for k in 0 to O loop
         if counter <= c_limit then
		 awe 	<= 0;
		 l		<= 1;
		 wait for 0.0000001ns;
		 hepsi 		<= hepsi   + 1;
		 counter 	<= counter + 1;
		 carry_i  	<= hepsi(0);
		 wait for 5ns;

		 for p in 0 to N-1 loop
		 b_i(awe) 	<= hepsi(l);
		 a_i(awe) 	<= hepsi(l+1);
		 awe 		<= awe + 1;
		 l			<= l + 2;
		 wait for 0.0000001ns;
		 end loop;
		 wait for 5ns;
		 else  
         --wait;
         finish(0);
         end if;
		 end loop;
    end process;


end Behavioral;
