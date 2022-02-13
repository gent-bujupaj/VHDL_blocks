----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2022 01:23:56 PM
-- Design Name: 
-- Module Name: shifter - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifter is
  Port ( 
  d  : in std_logic_vector(15 downto 0);
  lr : in std_logic;
  shift_count : in std_logic_vector(7 downto 0);
  y : out std_logic_vector(15 downto 0)
  
  );
end shifter;

architecture Behavioral of shifter is

begin
    process ( d, lr , shift_count)
    begin
        if lr = '1' then 
            y <= SHR(d, shift_count); -- shift right if lr is set to 1 for the amount that is in shift count
        else 
            y <= SHL(d, shift_count); -- shift left if lr is set to 1 for the amount that is in shift count
        end if;             
    end process;


end Behavioral;
