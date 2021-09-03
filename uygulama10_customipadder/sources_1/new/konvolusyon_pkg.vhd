LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

package konvolusyon_pkg is

type mul_1 is array (8 downto 0) of std_logic_vector(15 downto 0);
type sum_1 is array ( 3 downto 0 ) of std_logic_vector(15 downto 0);
type sum_2 is array ( 3 downto 0 ) of std_logic_vector(15 downto 0);

type pixel is array (2 downto 0) of std_logic_vector(7 downto 0);
type kernel_type is array ( 2 downto 0) of pixel;


end package;
