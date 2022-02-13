----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2022 08:42:59 PM
-- Design Name: 
-- Module Name: div84 - Behavioral
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
-- Division 8/4 = 8:4
---8 bit numerator divided by 4 bit divisior 
-- gives us a 8 bit qoutient and a 4 bit reminder .

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

entity div84 is  
    Port ( 
        numerator :  in  std_logic_vector(7 downto 0);
        denominator: in  std_logic_vector(3 downto 0);
        qoutient:    out std_logic_vector(7 downto 0);
        remainder:   out std_logic_vector(3 downto 0)
    );
end div84;

architecture Behavioral of div84 is
------------------------------------------------------------
-- Procedure 4 bit div

-- Algorithm
-- 1. Store the numerator in the concatenation n1: n2 
-- 2. Store the denominator in d 
-- 3. Repeat 4 times
--    Shift n1:n2 left one bit 
--    If n1 >= d
--       n1 = n1 - d
--       n2(0)= '1'
-- 4. qoutinent = n2 
--    remainder = n1(3 downto 0) 
procedure div4 (
    numer: in std_logic_vector(7 downto 0);
    denom: in std_logic_vector(3 downto 0);
    qoutient: out std_logic_vector(3 downto 0);
    remainder: out std_logic_vector(3 downto 0)) is
---------------------------------------------------

variable d, n1 : std_logic_vector(4 downto 0);
variable n2: std_logic_vector(3 downto 0);

begin
    d := '0' & denom; -- extend the value for d 
    n2 := numer(3 downto 0); -- assign the variable of n2
    n1 := '0' & numer(7 downto 4);  -- assign the variable of n1 
    
    for i in 0 to 3 loop 
        n1 := n1(3 downto 0) & n2(3);
        n2 := n2(2 downto 0) & '0';
        if n1 >= d then
            n1   := n1 - d;
            n2(0):= '1';
        end if;
     end loop;
     qoutient  := n2;
     remainder := n1(3 downto 0);  
end procedure;
----------------------------------------------------------------------
begin

    process(numerator, denominator)
    variable remH, remL, qoutH, qoutL: std_logic_vector(3 downto 0);
    begin
        div4("0000" & numerator(7 downto 4), denominator,qoutH,remH); -- first division block for the higher part
        div4(remH & numerator(3 downto 0), denominator , qoutL,remL);
        
        -------------------------------
        
        qoutient(7 downto 4) <= qoutH;
        qoutient(3 downto 0) <= qoutL;
        remainder <= remL;
 
    
    end process;


end Behavioral;
