library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;
library work;
use work.txt_util.all;
entity design_1_wrapper_tb is
-- Port ( );
end design_1_wrapper_tb;
architecture Behavioral of design_1_wrapper_tb is
component design_1_wrapper is
port (
led_16bits_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
reset : in STD_LOGIC;
sys_clock : in STD_LOGIC;
usb_uart_rxd : in STD_LOGIC;
usb_uart_txd : out STD_LOGIC
);
end component;
signal led_16bits_tri_o : STD_LOGIC_VECTOR ( 15 downto 0 );
signal reset : STD_LOGIC;
signal sys_clock : STD_LOGIC := '0';
signal usb_uart_rxd : STD_LOGIC;
signal usb_uart_txd : STD_LOGIC;
component UART is
Generic (
CLK_FREQ : integer := 50e6; -- system clock frequency in Hz
BAUD_RATE : integer := 115200; -- baud rate value
PARITY_BIT : string := "none"; -- type of parity: "none", "even", "odd", "mark", "space"
USE_DEBOUNCER : boolean := True -- enable/disable debouncer
);
Port (
-- CLOCK AND RESET
CLK : in std_logic; -- system clock
RST : in std_logic; -- high active synchronous reset
-- UART INTERFACE
UART_TXD : out std_logic; -- serial transmit data
UART_RXD : in std_logic; -- serial receive data
-- USER DATA INPUT INTERFACE
DIN : in std_logic_vector(7 downto 0); -- input data to be transmitted over UART
DIN_VLD : in std_logic; -- when DIN_VLD = 1, input data (DIN) are valid
DIN_RDY : out std_logic; -- when DIN_RDY = 1, transmitter is ready and valid input data will be accepted for transmiting
-- USER DATA OUTPUT INTERFACE
DOUT : out std_logic_vector(7 downto 0); -- output data received via UART
DOUT_VLD : out std_logic; -- when DOUT_VLD = 1, output data (DOUT) are valid (is assert only for one clock cycle)
FRAME_ERROR : out std_logic; -- when FRAME_ERROR = 1, stop bit was invalid (is assert only for one clock cycle)
PARITY_ERROR : out std_logic -- when PARITY_ERROR = 1, parity bit was invalid (is assert only for one clock cycle)
);
end component;
-- USER DATA INPUT INTERFACE
signal DIN : std_logic_vector(7 downto 0); -- input data to be transmitted over UART
signal DIN_VLD : std_logic; -- when DIN_VLD = 1, input data (DIN) are valid
signal DIN_RDY : std_logic; -- when DIN_RDY = 1, transmitter is ready and valid input data will be accepted for transmiting
-- USER DATA OUTPUT INTERFACE
signal DOUT : std_logic_vector(7 downto 0); -- output data received via UART
signal DOUT_VLD : std_logic; -- when DOUT_VLD = 1, output data (DOUT) are valid (is assert only for one clock cycle)
signal FRAME_ERROR : std_logic; -- when FRAME_ERROR = 1, stop bit was invalid (is assert only for one clock cycle)
signal PARITY_ERROR : std_logic; -- when PARITY_ERROR = 1, parity bit was invalid (is assert only for one clock cycle)
signal c : character;
begin
DUT: design_1_wrapper port map(led_16bits_tri_o,reset,sys_clock,usb_uart_rxd,usb_uart_txd);
UART_Transmitter: UART generic map(
CLK_FREQ => 100e6, -- system clock frequency in Hz
BAUD_RATE => 9600, -- baud rate value
PARITY_BIT => "none", -- type of parity: "none", "even", "odd", "mark", "space"
USE_DEBOUNCER => True -- enable/disable debouncer
)
Port map(sys_clock,not reset,usb_uart_rxd,usb_uart_txd,DIN,DIN_VLD,DIN_RDY,DOUT,DOUT_VLD,FRAME_ERROR,PARITY_ERROR);
sys_clock <= not sys_clock after 5 ns;
process
variable var1 : line;
begin
reset <= '0';
wait for 10 ns;
reset <= '1';
for i in 0 to 11 loop
wait until DOUT_VLD='1';
c <= convert_slv_to_char(DOUT);
write(var1, c);
end loop;
report "message: "&var1.all;
end process;
end Behavioral;