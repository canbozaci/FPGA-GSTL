library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity tb_datapath is
--  Port ( );
end tb_datapath;

architecture Behavioral of tb_datapath is
component datapath is
Port(
	clk 	: in std_logic;
	x_sel	: in std_logic;
	y_sel	: in std_logic;
	x_ld	: in std_logic;
	y_ld	: in std_logic;
	x_neq_y : out std_logic;
	x_lt_y  : out std_logic;
	d_ld    : in std_logic;
	d_o		: out std_logic_vector(31 downto 0);
	x_i 	: in std_logic_vector(31 downto 0);
	y_i 	: in std_logic_vector(31 downto 0)
	);
end component;

signal clk 		  :   std_logic;
signal x_sel	  :   std_logic:='0';
signal y_sel	  :   std_logic:='0';
signal x_ld	      :   std_logic:='0';
signal y_ld	      :   std_logic:='0';
signal x_neq_y    :   std_logic:='0';
signal x_lt_y     :   std_logic:='0';
signal d_ld       :   std_logic:='0';
signal d_o		  :   std_logic_vector(31 downto 0):=( others => '0');
signal x_i 	      :   std_logic_vector(31 downto 0):=( others => '0');
signal y_i 	      :   std_logic_vector(31 downto 0):=( others => '0');

constant clkperiod : time := 10 ns;

begin          
UUT: datapath
	port map(
	clk 		=> clk 		   ,
	x_sel	    => x_sel	   ,
	y_sel	    => y_sel	   ,
	x_ld	    => x_ld	       ,
	y_ld	    => y_ld	       ,
	x_neq_y     => x_neq_y     ,
	x_lt_y      => x_lt_y      ,
	d_ld        => d_ld        ,
	d_o		    => d_o		   ,
	x_i 	    => x_i 	       ,
	y_i         => y_i 	  
	 );
	 
	 	
CLKGEN : process begin
	clk	<= '1';
	wait for clkperiod/2;
	clk	<= '0';
	wait for clkperiod/2;
	end process;
	 
	 
P_STIMULI : process begin
	wait for 10 ns;
	x_i 	<= CONV_STD_LOGIC_VECTOR(155,32);
	y_i		<= CONV_STD_LOGIC_VECTOR(156,32);
	x_sel	<= '0';
	y_sel	<= '0';
	wait for 10 ns;
	x_sel	<= '0';
    y_sel	<= '0';
	x_ld	<= '1';
	y_ld	<= '1';
	wait for 10 ns;
	x_ld 	<= '0';
	y_ld	<= '0';
	d_ld	<= '1';
	wait for 10 ns;
	d_ld 	<= '0';
	
	assert false
	report "Simulation has done correctly."
	severity failure;
	
	
end process;		 
end Behavioral;
