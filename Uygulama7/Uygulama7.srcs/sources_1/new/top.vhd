library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top is
 Port ( 
	clk			: in std_logic;
	reset 		: in std_logic;
	start 		: in std_logic;
	A	  		: in std_logic_vector(7 downto 0);
	B	  		: in std_logic_vector(7 downto 0);
	product_t 	: out std_logic_vector(15 downto 0);
	ready		: out std_logic
 );
end top;

architecture Behavioral of top is

component multiplier is
 Port(
	clk 	: in std_logic;
	A		: in std_logic_vector(7 downto 0);
	load	: in std_logic;
	shift_r	: in std_logic;
	dataout : out std_logic
	);
end component;

component Multiplicand is
    Port ( 
    clk		: in std_logic;
    dataout : out std_logic_vector(7 downto 0);
    B		: in std_logic_vector(7 downto 0);
    load 	: in std_logic
		);

end component;

component product is
Port (
	clk 	: in std_logic;
	reset	: in std_logic;
	load 	: in std_logic;
	shift_r : in std_logic;
	datain	: in std_logic_vector(8 downto 0);
	dataout	: out std_logic_vector (15 downto 0)
 );
end component;

component controller is
 Port (
	clk						: in std_logic;
	reset 					: in std_logic;
	start 					: in std_logic;
	load_multiplier 		: out std_logic;
	shift_multiplier 		: out std_logic;
	load_multiplicand		: out std_logic;
	reset_product 			: out std_logic;
	load_product 			: out std_logic;
	shift_product 			: out std_logic;
	ready					: out std_logic
 );
end component;

component rc_adder is
		generic (
		N	: integer := 8
		); 
		port(
		a_i			: in std_logic_vector (N-1 downto 0);
		b_i			: in std_logic_vector (N-1 downto 0);
		carry_i		: in std_logic;
		sum_o		: out std_logic_vector (N-1 downto 0);
		carry_o		: out std_logic
		);	
		end component;

signal load_muler : std_logic:='0';
signal shift_muler : std_logic:='0';
signal and_mulert : std_logic:='0';
signal and_muler  : std_logic_vector(7 downto 0):=(others => '0');

signal load_muland : std_logic:='0';
signal and_muland 	: std_logic_vector(7 downto 0):=(others => '0');

signal reset_pro : std_logic:='0';
signal load_pro : std_logic:='0';
signal shift_pro : std_logic:='0';
signal out_pro	: std_logic_vector(15 downto 0):=(others => '0');


signal adder2_i 	: std_logic_vector(7 downto 0):=(others => '0');
signal adder1_i	 	: std_logic_vector(7 downto 0):=(others => '0');
signal adder_sum 	: std_logic_vector(8 downto 0):=(others => '0');
signal adder_temp 	: std_logic_vector (7 downto 0):=(others => '0');
signal carry_o		: std_logic:='0';

signal ready_temp : std_logic:='0';
signal one  :  unsigned(15 downto 0) := (0 => '1', others => '0');
begin

control: controller 
	port map( 
	clk 	=> clk,
	reset	=> reset,
	start => 	start,
	load_multiplier => 	load_muler,	
	shift_multiplier =>	shift_muler,	
	load_multiplicand => load_muland,		
	reset_product 	=>	reset_pro,	
	load_product 	=> 	load_pro,	
	shift_product 	=>	shift_pro,	
    ready			=> ready_temp		-- ready_temp deisik		
	);
	
muler: multiplier
	port map(
	clk 	=>	clk	,
	A		=>	A	,
	load	=>	load_muler,
	shift_r	=>	shift_muler	,
	dataout =>	and_mulert	
	);
	
muland : Multiplicand
	 port map( 
	 clk	 =>  clk,
	 dataout =>  and_muland,
	 B		 => B,
	 load 	 => load_muland	
		);
pro : product
		port map(
			clk 	=> 	clk	,
			reset	=> 	reset_pro,
			load 	=> 	load_pro,
			shift_r => 	shift_pro,
			datain	=> 	adder_sum,
			dataout	=> 	out_pro
		 );
adder: rc_adder 
	port map( 
	a_i 	=> adder1_i,
	b_i		=> adder2_i,
	carry_i => '0',
	sum_o	=> adder_temp,
	carry_o => carry_o
	);

ready		<= ready_temp;	-- new
adder2_i	<= out_pro(15 downto 8);
adder_sum	<= carry_o & adder_temp;
adder1_i	<= and_muler and and_muland;

process(and_mulert) begin
	if( and_mulert = '1') then
		and_muler <= ( others => '1');
	elsif( and_mulert = '0') then
		and_muler <= ( others => '0');
	end if;
end process;




process(ready_temp,clk) begin
	if (rising_edge(clk)) then
			if ( ready_temp = '1') then
				product_t 	<= out_pro;
			end if;
	end if;
end process;
end Behavioral;
