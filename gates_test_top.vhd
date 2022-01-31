----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2022 11:05:45 AM
-- Design Name: 
-- Module Name: gates_test_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gates_test_top is
  Port ( 
  sw : in std_logic_vector(1 downto 0);
  led : out std_logic_vector(5 downto 0)
  
  );
end gates_test_top;
architecture Behavioral of gates_test_top is
component gates_test is 
 port(
    a : in std_logic;
    b : in std_logic;
    z : out std_logic_vector(5 downto 0)
     );
end component;   

begin

-- map our component to given fpga ports, maybe have a look of the manual of the FPGA

c1: gates_test
    port map (
    
    a=> sw(1),
    b=> sw(0),
    z=> led
    
    );


end Behavioral;
