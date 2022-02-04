----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2022 09:03:43 AM
-- Design Name: 
-- Module Name: mux21b - Behavioral
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

entity mux21b is
  Port (
   a: in std_logic;
   b: in std_logic;
   s: in std_logic;
   y: out std_logic
   );
end mux21b;

architecture Behavioral of mux21b is

begin

    MUX: process(a,b,s)
    begin
        if s = '0' then
           y <= a;
        else 
           y <= b;
        end if;      
    end process;

--    y <= a when s= '0' else b; conditional signal assignment 

end Behavioral;
