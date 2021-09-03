library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity module_4 is
 Port (
	clk 	: in std_logic;
	data_i	: in std_logic_vector(7 downto 0);
	load	: in std_logic;
	data_o	: out std_logic_vector(8 downto 0):="000000000"
 );
end module_4;

architecture Behavioral of module_4 is


signal parity_e		: std_logic;
signal data_o_temp 	: std_logic_vector(8 downto 0);
signal counter_d	: integer := 0;
signal counter_u	: integer := 0;
signal counter_do 	: integer := 8;
signal data_act		: std_logic:= '0';
signal ready		: std_logic:='0';

begin
process(clk,load) begin
	if (rising_edge(load)) then
		data_act	<= '1';
		counter_u 	<= 0;
		for counter_d in 0 to 7 loop
			if( data_i(counter_d) = '1') then
				counter_u <= counter_u + 1;
			end if;
		end loop;	
	end if;
	if ( load = '1' ) then
		if(counter_u = 1 or counter_u = 3 or counter_u = 5 or counter_u = 7)	then
			parity_e	<= '1';
		else
			parity_e	<= '0';
		end if;
	end if;

	if (rising_edge(clk)) then
		ready		<= '0';
		if	( ready = '1') then
			data_o 	<= "000000000";
		end if;
		if ( data_act = '1') then
			if ( counter_do = 0) then
				data_o(counter_do) 	<= parity_e;
				counter_do		 	<= 8;
				data_act			<= '0';
				ready				<= '1';
			else 
				data_o(counter_do) 	<= data_i(counter_do -1);
				counter_do 			<= counter_do -1;
			end if;
		end if;
	end if;
end process;
end Behavioral;
