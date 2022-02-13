----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2022 06:59:39 PM
-- Design Name: 
-- Module Name: mult4a - Behavioral
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

entity mult4a is
  Port ( 
    a: in std_logic_vector(3 downto 0);
    b: in std_logic_vector(3 downto 0);
    p: out std_logic_vector(7 downto 0)
  );
end mult4a;

architecture Behavioral of mult4a is

begin
    process(a,b)
    variable pv, bp: std_logic_vector(7 downto 0);
    begin
        pv := "00000000";
        bp := "0000" & b;
        
        for i in 0 to 3 loop
            if a(i) = '1' then
                pv := pv + bp;          -- this is the addition if the we have the value of select on the MUX
            end if;
            bp := bp(6 downto 0) & '0'; -- this is the left shift
        end loop;
        p <= pv;
    end process;             
        
end Behavioral;