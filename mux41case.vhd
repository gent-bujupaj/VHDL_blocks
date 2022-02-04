----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2022 10:00:49 AM
-- Design Name: 
-- Module Name: mux41case - Behavioral
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

entity mux41case is
 Port ( 
 c :in std_logic_vector(3 downto 0);
 s :in std_logic_vector(1 downto 0);
 z : out std_logic
 );
end mux41case;

architecture Behavioral of mux41case is

begin

p1: process (c,s)
begin 
    case s is
    when "00"   => z <= c(0);
    when "01"   => z <= c(1);
    when "10"   => z <= c(2);
    when "11"   => z <= c(0);
    when others => null;
    end case;
end process;


end Behavioral;
