
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library std;  -- This is added for ''finish'' statement
use std.env.all;

entity tb_top is -- testbench top declaration
generic(
N : integer := 32 -- burda tanımlamazsan N'i görmüyor bu yüzden aşağıda tanımlasan bile yukarıda tekrar tanımlaman gerekiyor
);
end tb_top;

architecture Behavioral of tb_top is
    
	component top is
		generic(
		N	: integer := 32
		);
		Port (
		A		: in std_logic_vector(31 downto 0);
		B		: in std_logic_vector(31 downto 0);
		CNT	: in std_logic_vector(3 downto 0);
		D 		: out std_logic_vector(31 downto 0)
		);
		end component;
    
    --input signals - with initial values
    signal A : std_logic_vector(31 downto 0);
	signal B : std_logic_vector(31 downto 0);
	signal CNT : std_logic_vector(3 downto 0); -- toplama
	--output signals
	signal D : std_logic_vector(31 downto 0); -- cikarma

    
begin
    
     uut: top  PORT MAP (
     A 			=> A,	
     B 			=> B,
     CNT		=> CNT,
     D			=> D
	 );
    
     -- Stimulus process
     stim_proc: process
     begin
		 A        <= x"1111_1111";
         B        <= x"1111_1111";
         CNT    <= x"0"    ;
         wait for 10 ns;
          A        <= x"1111_1111";
          B        <= x"1111_1110";
          CNT    <= x"1"    ;
          wait for 10 ns;
          A        <= x"1111_1111";
          B        <= x"1111_1111";
          CNT    <= x"2"    ;      
          wait for 10 ns;
          A        <= x"1111_1111";
          B        <= x"1111_1111";
          CNT    <= x"3"    ;
          wait for 10 ns;
          A        <= x"1111_1111";
          B        <= x"1111_1111";
          CNT    <= x"4"    ;
          wait for 10 ns;
          A        <= x"1111_1111";
          B        <= x"1111_1111";
          CNT    <= x"5"    ;
          wait for 10 ns;
          A        <= x"1111_1111";
          B        <= x"0101_1010";
          CNT    <= x"6"    ;
          wait for 10 ns;
          A        <= x"1110_1110";
          B        <= x"0101_1010";
          CNT    <= x"7"    ;
          wait for 10 ns;
          A        <= x"1111_1111";
          B        <= x"0101_1010";
          CNT    <= x"8"    ;
          wait for 10 ns;
          A        <= x"0100_1001";
          B        <= x"0101_1011";
          CNT    <= x"9"    ;
          wait for 10 ns;
          A        <= x"0100_1001";
          B        <= x"0101_1011";
          CNT    <= x"A"    ;
          wait for 10 ns;
          A        <= x"0100_1001";
          B        <= x"0101_1011";
          CNT    <= x"B"    ;
          wait for 10 ns;
          A        <= x"0100_1001";
          B        <= x"0101_1011";
          CNT    <= x"C"    ;
          wait for 10 ns;
           A        <= x"0100_1001";
          B        <= x"0101_1011";
          CNT    <= x"D"    ;
          wait for 10 ns;
           A        <= x"0100_1001";
          B        <= x"0101_1011";
          CNT    <= x"E"    ;
          wait for 10 ns;
           A        <= x"0100_1001";
          B        <= x"0101_1011";
          CNT    <= x"F"    ;
          wait for 10 ns;
         --wait;
		 
         finish(0);
         
    end process;


end Behavioral;
