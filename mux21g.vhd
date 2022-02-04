----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2022 10:39:56 AM
-- Design Name: 
-- Module Name: mux21g - Behavioral
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

entity mux21g is
    generic (N : integer);
  Port ( 
  a : in std_logic_vector(N-1  downto 0);
  b : in std_logic_vector(N-1  downto 0);
  s : in std_logic;
  y : out std_logic_vector(N-1 downto 0)
  );
end mux21g;

architecture Behavioral of mux21g is

begin
    process (a, b, s)
        begin 
            if s = '0' then 
                y <= a;
            else 
                y <= b;
            end if;
     end process;               

end Behavioral;
