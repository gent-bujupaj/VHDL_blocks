----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2022 06:16:03 PM
-- Design Name: 
-- Module Name: reg4bit - Behavioral
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

entity reg4bit is
  Port (
    load: in std_logic;
    inp : in std_logic_vector(3 downto 0);
    clk : in std_logic;
    clr : in std_logic;
    q   : out std_logic_vector(3 downto 0)
   );
end reg4bit;

architecture Behavioral of reg4bit is

begin
    process(clk, clr)
    begin
        if clr = '1' then 
            q <= "0000";
        elsif clk'event and clk='1' then
            if load = '1' then
                q <= inp;
            end if;
        end if;             
    
    end process;


end Behavioral;
