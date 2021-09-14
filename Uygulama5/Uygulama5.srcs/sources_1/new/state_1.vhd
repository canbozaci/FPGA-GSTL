library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity state_1 is
Port ( 
	clk 	: in std_logic;
	reset 	: in std_logic;
	r1		: out std_logic;
	r2		: out std_logic;
	y1		: out std_logic;
	y2		: out std_logic;
	g1		: out std_logic;
	g2		: out std_logic
);
end state_1;

architecture Behavioral of state_1 is

signal counter_gr : integer:= 0;
signal counter_yr : integer:= 0;
signal counter_rg : integer:= 0;
signal counter_ry : integer:= 0;

type q1_state is (S_GR, S_YR, S_RG,S_RY);
signal state : q1_state := S_GR;


 ------------ clk period = 1s -------------------
begin
process (clk)
begin
if(rising_edge(clk)) then
case state is

	when S_GR =>
		if ( reset = '1') then
			state <= S_GR;
			r1 	  <= '0';
			r2 	  <= '0';
			y1 	  <= '0';
			y2 	  <= '0';
			g1 	  <= '0';
			g2 	  <= '0';
			counter_gr <= 0;
			counter_yr <= 0;
			counter_rg <= 0;
			counter_ry <= 0;			
		elsif ( counter_gr < 49) then
			state <= S_GR;
			r1 	  <= '0';
			r2 	  <= '1';
			y1 	  <= '0';
			y2 	  <= '0';
			g1 	  <= '1';
			g2 	  <= '0';
			counter_gr <= counter_gr + 1;
		else
			state <= S_YR;
			r1 	  <= '0';
			r2 	  <= '1';
			y1 	  <= '1';
			y2 	  <= '0';
			g1 	  <= '0';
			g2 	  <= '0';
			counter_gr <= 0;
		end if;
---- ---- ---- -------- -------- -------- -------- -------- -------- -------- -------- -------- ---- 				
	WHEN S_YR =>
		if ( reset = '1') then
			state <= S_GR;
			r1 	  <= '0';
			r2 	  <= '0';
			y1 	  <= '0';
			y2 	  <= '0';
			g1 	  <= '0';
			g2 	  <= '0';
			counter_gr <= 0;
			counter_yr <= 0;
			counter_rg <= 0;
			counter_ry <= 0;
		elsif ( counter_yr < 4 ) then
			state <= S_YR;
			r1 	  <= '0';
			r2 	  <= '1';
			y1 	  <= '1';
			y2 	  <= '0';
			g1 	  <= '0';
			g2 	  <= '0';
			counter_yr <= counter_yr +1;
		else
			state <= S_RG;
			r1 	  <= '1';
			r2 	  <= '0';
			y1 	  <= '0';
			y2 	  <= '0';
			g1 	  <= '0';
			g2 	  <= '1';
			counter_yr <= 0;
		end if;
---- ---- ---- -------- -------- -------- -------- -------- -------- -------- -------- -------- ---- 		
	when S_RG =>
		if ( reset = '1') then
			state <= S_GR;
			r1 	  <= '0';
			r2 	  <= '0';
			y1 	  <= '0';
			y2 	  <= '0';
			g1 	  <= '0';
			g2 	  <= '0';
			counter_gr <= 0;
			counter_yr <= 0;
			counter_rg <= 0;
			counter_ry <= 0;
		elsif ( counter_rg < 34) then
			state <= S_RG;
			r1 	  <= '1';
			r2 	  <= '0';
			y1 	  <= '0';
			y2 	  <= '0';
			g1 	  <= '0';
			g2 	  <= '1';
			counter_rg <= counter_rg + 1;
		else
			state <= S_RY;
			r1 	  <= '1';
			r2 	  <= '0';
			y1 	  <= '0';
			y2 	  <= '1';
			g1 	  <= '0';
			g2 	  <= '0';
			counter_rg <= 0;
		end if;
---- ---- ---- -------- -------- -------- -------- -------- -------- -------- -------- -------- ---- 
	WHEN S_RY =>
		if ( reset = '1') then
			state <= S_GR;
			r1 	  <= '0';
			r2 	  <= '0';
			y1 	  <= '0';
			y2 	  <= '0';
			g1 	  <= '0';
			g2 	  <= '0';
			counter_gr <= 0;
			counter_yr <= 0;
			counter_rg <= 0;
			counter_ry <= 0;
		elsif ( counter_ry < 4) then
			state <= S_RY;
			r1 	  <= '1';
			r2 	  <= '0';
			y1 	  <= '0';
			y2 	  <= '1';
			g1 	  <= '0';
			g2 	  <= '0';
			counter_ry <= counter_ry +1;
		else
			state <= S_GR;
			r1 	  <= '0';
			r2 	  <= '1';
			y1 	  <= '0';
			y2 	  <= '0';
			g1 	  <= '1';
			g2 	  <= '0';
			counter_ry <= 0;
		end if;
end case;
end if;
end process;
end Behavioral;
