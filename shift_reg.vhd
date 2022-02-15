----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2022 06:49:38 PM
-- Design Name: 
-- Module Name: shift_reg - Behavioral
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

entity shift_reg is
  Port ( 
    clk : in std_logic;
    clr : in std_logic;
    data_in : in std_logic;
    q : out std_logic_vector(3 downto 0)
  );
end shift_reg;

architecture Behavioral of shift_reg is
signal qs : std_logic_vector(3 downto 0);
begin
    process ( clk, clr)
    begin
        if clr = '1' then 
            qs <= "0000";
        elsif clk'event and clk='1' then
            qs(3) <= data_in;
            qs(2 downto 0) <= qs(3 downto 1);
        end if;        
    
    end process; 
    q <= qs;
end Behavioral;
