----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2022 08:52:46 PM
-- Design Name: 
-- Module Name: count3bit - Behavioral
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

entity count3bit is
 Port ( 
    clr : in std_logic;
    clk : in std_logic;
    q   : out std_logic_vector(2 downto 0)
 );
end count3bit;

architecture Behavioral of count3bit is
signal count: std_logic_vector(2 downto 0);
begin
    process(clk, clr)
    begin
        if clr = '1' then 
            count <= "000";
        elsif  clk'event and clk= '1' then
            count <= count + 1;
        end if;
    end process;
    q <= count;            


end Behavioral;
