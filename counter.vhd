----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2022 10:23:43 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    Generic( N: integer := 8);
    Port (
        clr : in std_logic;
        clk : in std_logic;
        q   : out std_logic_vector(N-1 downto 0)
     );
end counter;

architecture Behavioral of counter is

signal count : std_logic_vector( N-1 downto 0);

begin
    process( clk, clr )
    begin 
        if clr = '1' then
            count <= (others => '0');
        elsif clk'event and clk= '1' then
            count <= count + 1;
        end if; 
     end process;
     q <= count;          


end Behavioral;
