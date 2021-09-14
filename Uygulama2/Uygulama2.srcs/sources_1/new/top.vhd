library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;


entity top is
generic(
 N	: integer := 32
 );
 Port (
 A		: in std_logic_vector(31 downto 0);
 B		: in std_logic_vector(31 downto 0);
 CNT	: in std_logic_vector(3 downto 0);
 D 		: out std_logic_vector(31 downto 0)
 );
end top;

architecture Behavioral of top is
-- COMPONENT TANIMLARI
	component rc_adder is
		generic (
		N	: integer := 32
		); 
		port(
		a_i			: in std_logic_vector (N-1 downto 0); -- N-1 olcak!
		b_i			: in std_logic_vector (N-1 downto 0);
		carry_i		: in std_logic;
		sum_o		: out std_logic_vector (N-1 downto 0);
		carry_o		: out std_logic
		);	
		end component;

	component rc_subtractor is
		generic (
		N	: integer := 32
		); 
		port(
		a_i			: in std_logic_vector (N-1 downto 0); -- N-1 olcak!
		b_i			: in std_logic_vector (N-1 downto 0);
		carry_i		: in std_logic;
		sum_o		: out std_logic_vector (N-1 downto 0);
		carry_o		: out std_logic
		);	
		end component;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- sinyal tanımları
signal toplama : std_logic_vector(31 downto 0);
signal cikarma : std_logic_vector(31 downto 0);
signal carry_t : std_logic; -- toplama
signal carry_c : std_logic; -- cikarma
signal first5  : integer;
signal a_uns   : unsigned(31 downto 0);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
begin
state_0000: rc_adder 
	port map( 
	a_i 	=> A,
	b_i		=> B,
	carry_i => '0',
	sum_o	=> toplama,
	carry_o => carry_t
	);
	state_0001:rc_subtractor
	port map( 
	a_i 	=> A,
	b_i		=> B,
	carry_i => '1',
	sum_o	=> cikarma,
	carry_o => carry_t
	);
Soru3 : process (CNT,a,b,a_uns,toplama,cikarma,first5)
begin
	first5 <= to_integer(unsigned(B(4 downto 0)));
	a_uns  <= (unsigned(A));
	if	(CNT = "0000") then
	D <= toplama;
	elsif  (CNT = "0001") then
	D <= cikarma;
	elsif  (CNT = "0010") then
	if ( A >= B ) then
		D <= x"FFFFFFFF";
		else
		D <= x"00000000";
		end if;
	elsif  (CNT = "0011") then
		if ( A < B ) then
		D <= x"FFFFFFFF";
		else
		D <= x"00000000";
		end if;
	elsif  (CNT = "0100") then
		if ( A /= B ) then
		D <= x"FFFFFFFF";
		else
		D <= x"00000000";
		end if;
	elsif  (CNT = "0101") then
		if ( A = B ) then
		D <= x"FFFFFFFF";
		else
		D <= x"00000000";
		end if;
	elsif (CNT = "0110") then
		D <= A and B;
	elsif (CNT = "0111") then
		D <= A or B;
	elsif ( CNT = "1000") then
		D <= A xor B;
	elsif ( CNT = "1001") then
		D <= std_logic_vector(a_uns rol first5); 
	elsif ( CNT = "1010") then
		D <= std_logic_vector(a_uns ror first5);
	elsif ( CNT = "1011") then
		D <= std_logic_vector(a_uns sll first5);
	elsif ( CNT = "1100") then
		D <= std_logic_vector(a_uns srl first5);
	else
		D <= x"00000000";
	end if;

end process;
end Behavioral;
