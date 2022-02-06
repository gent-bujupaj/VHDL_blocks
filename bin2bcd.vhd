----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2022 08:24:21 PM
-- Design Name: 
-- Module Name: binbcd6 - Behavioral
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

entity binbcd6 is
  Port ( 
        B: in std_logic_vector(5 downto 0);
        P: out std_logic_vector(6 downto 0)
  );
  
  -- 5 bit binary to BCD converter , just for overview : HAS NOT BEEN TESTED
  -- // needs to be reviewed again ... 
  
end binbcd6;

architecture Behavioral of binbcd6 is

begin
    bcd1: process(B)
    variable z: std_logic_vector(12 downto 0);
    begin 
    
    for i in 0 to 12 loop
        z(i) := '0';
    end loop;
    z(8 downto 3) := B;
    
    for i in 0 to 2 loop
        if z(9 downto 6) > 4 then
        z(9 downto 6) := z(9 downto 6) + 3;
        end if;
        z(12 downto 1) := z(11 downto 0);
     end loop;
     
     P <= z(12 downto 6);       
    
    end process;


end Behavioral;
