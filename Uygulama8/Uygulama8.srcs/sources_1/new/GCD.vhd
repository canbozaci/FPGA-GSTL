library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity GCD is
Port (
	clk		: in std_logic;
	go_i 	: in std_logic;
	x_i	  	: in std_logic_vector(31 downto 0);
	y_i	  	: in std_logic_vector(31 downto 0);
	d_o	 	: out std_logic_vector(31 downto 0)
 );
end GCD;

architecture Behavioral of GCD is

------------- Component Declerations 
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
	d_ld    : out std_logic
	);
end component;

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
-------------  -------------  -------------  -------------  -------------  -------------  -------------  -------------  -------------  ------------- 
------------- Signal Declerations
 
 -- Common Ones
  signal s_x_sel 	: std_logic :='0';
  signal s_y_sel 	: std_logic :='0';
  signal s_x_ld 	: std_logic :='0';
  signal s_y_ld 	: std_logic :='0';
  signal s_x_neq_y	: std_logic :='0';
  signal s_x_lt_y 	: std_logic :='0';
  signal s_d_ld		: std_logic :='0';
  
 
 
-------------  -------------  -------------  -------------  -------------  -------------  -------------  -------------  ------------- 
begin
------------- Port Map
control : controller
	 port map(
	 clk		=> 		clk			,
	 go_i	    => 		go_i		,
	 x_sel	    =>      s_x_sel 	,
	 y_sel	    =>      s_y_sel 	,
	 x_ld	    =>      s_x_ld 	  	,
	 y_ld	    =>      s_y_ld 	   	,
	 x_neq_y    =>      s_x_neq_y	,
	 x_lt_y     =>      s_x_lt_y 	,
	 d_ld       =>      s_d_ld		
	 );
	 
datap : datapath
	port map(
	clk		  =>	  clk 		  ,
	x_sel	  =>      s_x_sel 	  ,
    y_sel	  =>      s_y_sel 	  ,
    x_ld	  =>      s_x_ld 	  ,
	y_ld	  =>      s_y_ld 	  ,
    x_neq_y   =>      s_x_neq_y	  ,
    x_lt_y    =>      s_x_lt_y 	  ,
    d_ld      =>      s_d_ld	  ,
    d_o		  => 	  d_o		  ,
    x_i 	  => 	  x_i		  ,
    y_i 	  =>  	  y_i		
	);
-------------  -------------  -------------  -------------  -------------  -------------  -------------  -------------  -------------  
process (clk) begin

end process;	

end Behavioral;
