library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.konvolusyon_pkg.ALL;

entity konvolusyon is
Port ( Kernel 		: in std_logic_vector(71 downto 0);
	   Image_Block 	: in std_logic_vector (71 downto 0);
	   Result_pixel : out std_logic_vector(15 downto 0));
end konvolusyon;

architecture Behavioral of konvolusyon is
	component MUL is
	Port (A : in std_logic_vector (7 downto 0);
	B : in std_logic_vector (7 downto 0);
	C : out std_logic_vector (15 downto 0));
	end component;
	component ADD is
	Port (A : in std_logic_vector (15 downto 0);
	B : in std_logic_vector (15 downto 0);
	C : out std_logic_vector (15 downto 0));
	end component;
	signal Kernel_tmp : kernel_type;
	signal Image_Block_tmp: kernel_type;
	signal mul_row1: mul_1;
	signal sum_row1: sum_1;
	signal sum_row2: sum_2;
	signal sum_row3: std_logic_vector(15 downto 0);
begin
	process(Kernel,Image_Block)
	begin
		for J in 0 to 2 loop
			for I in 0 to 2 loop 
				Kernel_tmp(I)(J) <= Kernel(71-24*j-8*i downto 71-24*j-8*i-7);
				Image_Block_tmp(I)(J) <= Image_Block(71-24*j-8*i downto 71-24*j-8*i-7);
			end loop;
		end loop;
	end process;
	GEN_MULI: for I in 0 to 2 generate
		GEN_MULJ: for J in 0 to 2 generate
			MULij: MUL Port map(Kernel_tmp(i)(j),Image_Block_tmp(i)(j),mul_row1(i*3+j));
		end generate;
	end generate;
	GEN_ADD1: for I in 0 to 3 generate
		ADDi_1: ADD Port map(mul_row1(2*I),mul_row1(2*I+1),sum_row1(I));
	end generate;
	GEN_ADD2: for I in 0 to 1 generate
		ADDi_2: ADD Port map(sum_row1(2*I),sum_row1(2*I+1),sum_row2(I));
	end generate;
	ADD_3: ADD Port map(sum_row2(0),sum_row2(1),sum_row3);
	ADD_4: ADD Port map(mul_row1(8),sum_row3,Result_pixel);
end Behavioral;
