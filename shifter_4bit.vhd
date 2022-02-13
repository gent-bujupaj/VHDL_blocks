----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2022 01:06:16 PM
-- Design Name: 
-- Module Name: shifter_4bit - Behavioral
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

----------------------------------------------------------------
-- we have a shifter which has a 4bit input and a 4 bit output.
-- we also have the corresponding select signals which determine the type of operation is done to the inputs 
-- S2  S1 S0  | INPUTS to OUTPUTS
--  0  0   0  | no shift              | d3  d2  d1  d0 
--  0  0   1  | shift right           | 0   d3  d2  d1
--  0  1   0  | shift left            | d2  d1  d0  0
--  0  1   1  | rotate right          | d0  d3  d2  d1
--  1  0   0  | rotate left           | d2  d1  d0  d3
--  1  0   1  | arithemtic shift right| d3  d3  d2  d1
--  1  1   0  | rotate right 2 bits   | d1  d0  d3  d2
--  1  1   1  | no shift              | d3  d2  d1  d0 

entity shifter_4bit is
  Port (
    d : in  std_logic_vector(3 downto 0);
    s : in  std_logic_vector(2 downto 0);
    y : out std_logic_vector(3 downto 0)
  
   );
end shifter_4bit;

architecture Behavioral of shifter_4bit is

begin
    process(d,s)
    begin
        case s is 
        when "000" => y <= d;                                 -- no shift        
        when "001" => y <='0' & d(3 downto 1);                -- shift right     
        when "010" => y <= d(2 downto 0) & '0';               -- shift left
        when "011" => y <= d(0) & d(3 downto 1);              -- rotate right  
        when "100" => y <= d(2 downto 0) & d(3);              -- rotate left
        when "101" => y <= d(3) & d(3 downto 1);              -- arithemtic shift right
        when "110" => y <= d(1 downto 0) & d(3 downto 2);     -- rotate right 2 bits
        when "111" => y <= d;                                 -- no shift
        when others => y<= d; 
     end case;      
    end process;


end Behavioral;
