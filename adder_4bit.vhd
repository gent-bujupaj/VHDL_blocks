----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2022 07:56:23 PM
-- Design Name: 
-- Module Name: adder_4bit - Behavioral
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

entity adder_4bit is
  Port ( 
    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    cf : out std_logic;
    ovf : out std_logic;
    s : out std_logic_vector(3 downto 0)
  );
  
end adder_4bit;

architecture Behavioral of adder_4bit is
signal c : std_logic_vector(4 downto 0);
begin
    c(0) <= '0';
    s <= a xor  b xor c(3 downto 0);
    c(4 downto 1) <= (a and b) or (c(3 downto 0) and (a xor b));
    cf  <= c(4);
    ovf <= c(3) xor c(4);


end Behavioral;
