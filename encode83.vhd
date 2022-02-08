----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2022 05:15:02 PM
-- Design Name: 
-- Module Name: encode83 - Behavioral
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

entity encode83 is
  Port ( 
    x : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(2 downto 0);
    valid_out : out std_logic
  );
end encode83;

architecture Behavioral of encode83 is

begin
    process(x)
    variable valid : std_logic;
    
    begin 
        y(2) <= x(7) or x(6) or x(5) or x(4);
        y(1) <= x(7) or x(6) or x(3) or x(2);
        y(2) <= x(7) or x(5) or x(3) or x(1);
        valid := '0';
            for i in 7 downto 0 loop
                valid := valid or x(i); -- check if all the vlaues are not zero, if not then set the valid to 1
            end loop;
        valid_out <= valid;
    
    end process;
    

end Behavioral;
