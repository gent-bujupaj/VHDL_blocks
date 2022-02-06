----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2022 09:00:24 PM
-- Design Name: 
-- Module Name: 1_bit_comparator - Behavioral
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
-- The variable g_out is 1 if x > y  or if x=y and g_in = 1
-- The variable e_out is 1 if x = y  and g_in=0 and l_in = 1
-- The variable l_out is 1 if x < y  or if x=y and l_in = 1

-- make a truth table then use K-maps 

-- intro to vhdl procedure 


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

entity bit_comparator is
  Port ( 
   x: in std_logic_vector(3 downto 0);
   y: in std_logic_vector(3 downto 0);
   gt: out std_logic;
   eq: out std_logic;
   lt: out std_logic
  );
end bit_comparator;

architecture Behavioral of bit_comparator is
procedure comp1bit (
                    x: in std_logic;
                    y: in std_logic;
                    Gin: in std_logic;
                    Lin: in std_logic;
                    Gout: out std_logic;
                    Lout: out std_logic;
                    Eout: out std_logic 
                    ) is
begin     
    Gout := (x and not y ) or (x and Gin) or (not y and Gin);
    Eout := (not x and not y and not Gin and not Lin) or (x and y and not Gin and not Lin);
    Lout := (not x and y) or (not x and Lin) or (y and Lin);     
end procedure;  
begin
    process (x,y)
    variable G,L,E : std_logic_vector(4 downto 0);
    begin
    
        G(0) := '0';
        L(0) := '0';
        for i in 0 to 3 loop
            comp1bit(x(i), y(i), G(i), L(i), G(i+1), L(i+1), E(i+1));
        end loop;
        gt <= G(4);
        eq <= E(4);
        lt <= L(4);
    
    end process;
    


end Behavioral;
