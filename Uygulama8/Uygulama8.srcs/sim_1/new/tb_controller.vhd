library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_controller is
--  Port ( );
end tb_controller;

architecture Behavioral of tb_controller is
component controller is
 Port(
	clk		: in std_logic;
	go_i	: in std_logic;
	x_sel	: out std_logic;
	y_sel	: out std_logic;
	x_ld	: out std_logic;
	y_ld	: out std_logic;
	x_neq_y : in std_logic;
	x_lt_y  : in std_logic;
	d_ld    : out std_logic;
	I_0		: out std_logic;
	I_1		: out std_logic;
	I_2		: out std_logic;
	I_3		: out std_logic;
	Q_0		: out std_logic;
	Q_1		: out std_logic;
	Q_2		: out std_logic;
	Q_3		: out std_logic
	);
end component;

begin
UUT: controller
	port map(
		clk		    => clk		     ,
		go_i	    => go_i	         ,
		x_sel	    => x_sel	     ,
		y_sel	    => y_sel	     ,
		x_ld	    => x_ld	         ,
		y_ld	    => y_ld	         ,
		x_neq_y     => x_neq_y       ,
		x_lt_y      => x_lt_y        ,
		d_ld        => d_ld          ,
		I_0		    => I_0		     ,
		I_1		    => I_1		     ,
		I_2		    => I_2		     ,
		I_3		    => I_3		     ,
		Q_0		    => Q_0		     ,
		Q_1		    => Q_1		     ,
		Q_2		    => Q_2		     ,
		Q_3		    => Q_3		
		);
	 	
CLKGEN : process begin
	clk	<= '1';
	wait for clkperiod/2;
	clk	<= '0';
	wait for clkperiod/2;
	end process;
	 
	 
P_STIMULI : process begin


end process;		

end Behavioral;
