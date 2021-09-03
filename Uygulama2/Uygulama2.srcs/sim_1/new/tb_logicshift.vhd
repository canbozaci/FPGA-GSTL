library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_logicshift is
generic (
N	: integer := 8;
H 	: integer := 3
); 
end tb_logicshift;

architecture Behavioral of tb_logicshift is

component logic_s is
generic (
N	: integer := 8;
H 	: integer := 3
); 
Port (
  A 	: in unsigned(N-1 downto 0);
  CNT 	: in std_logic;	
  B 	: in unsigned(H-1 downto 0);
  D 	: out std_logic_vector(N-1 downto 0)
 );
end component;
--input
signal A : unsigned(N-1 downto 0):=(others => '0');  num1  <=(30 downto 4 <= '0' , '1','0','1','0');
signal CNT : std_logic:= '0';
signal B : unsigned(H-1 downto 0):=(others => '0');
--output
signal D : std_logic_vector(N-1 downto 0);


begin
    
     uut: logic_s PORT MAP (
     A 			=> A,
     B 			=> B,
     CNT		=> CNT,
     D			=> D
	 );
    
     -- Stimulus process
     stim_proc: process
     begin
	CNT <= '0';
    A <= "10000000";
    B <= "001";
    wait for 10 ns;
     CNT <= '0';
    A <= "10011000";
    B <= "011";
    wait for 10 ns;
     CNT <= '0';
    A <= "00000001";
    B <= "001";
    wait for 10 ns;
    CNT <= '1';
    A <= "10000111";
    B <= "101";
    wait for 10 ns;
     CNT <= '1';
    A <= "10100111";
    B <= "111";
    wait for 10 ns;
     CNT <= '0';
    A <= "11000111";
    B <= "001";
    wait for 10 ns;
     CNT <= '0';
    A <= "10001111";
    B <= "100";
    wait for 10 ns;
	
	assert false
	report "SIM DONE"
	severity failure;
	end process;
end Behavioral;
