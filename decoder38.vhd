----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2022 04:43:03 PM
-- Design Name: 
-- Module Name: decoder38 - Behavioral
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

entity decoder38 is
  Port ( 
  a: in std_logic_vector(2 downto 0);
  y: out std_logic_vector(7 downto 0)
  );
end decoder38;

architecture Behavioral of decoder38 is

begin
    process(a)
    variable j:integer;
    begin
        j:= conv_integer(a);
        for i in 0 to 7 loop
            if (i=j) then 
                y(i) <= '1';
            else
                y(i) <= '0';
            end if;    
    
        end loop;
    end process;
end Behavioral;
