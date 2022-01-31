----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/31/2022 10:05:16 AM
-- Design Name: 
-- Module Name: test_1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gates_test is
  Port (
    a : in std_logic;
    b : in std_logic;
    z : out std_ulogic_vector(5 downto 0)
     );
end gates_test;

architecture Behavioral of gates_test is

begin
    z(5) <= a and b;
    z(4) <= a nand b;
    z(3) <= a or b;
    z(2) <= a nor b;
    z(1) <= a xor b;
    z(0) <= a xnor b;


end Behavioral;
