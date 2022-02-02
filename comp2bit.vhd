----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2022 08:32:01 AM
-- Design Name: 
-- Module Name: comp2bit - Behavioral
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
-----------------------------------------------------
-- 2 bit comparitor of inputs , produces output flag for 3 cases ex. a < b, a > b, a = b

entity comp2bit is
  Port ( 
  a : in std_logic_vector(1 downto 0);
  b : in std_logic_vector(1 downto 0);
  a_lt_b : out std_logic;
  a_gt_b : out std_logic;
  a_eq_b : out std_logic
  );
end comp2bit;

architecture Behavioral of comp2bit is

-- the architecture consists of the logic equation that were derived from the K map

begin

a_eq_b <= (not b(1) and not b(0) and not a(1) and not a(0)) or
          (not b(1) and     b(0) and not a(1) and     a(0)) or
          (    b(1) and not b(0) and     a(1) and not a(0)) or
          (    b(1) and     b(0) and     a(1) and     a(0));
-------------------------------------------------------------------
a_gt_b <= (not b(1) and a(1)) or
          (not b(1) and not b(0) and a(0)) or
          (not b(0) and     a(1) and a(0));

a_lt_b <= (b(1) and not a(1)) or
          (b(1) and b(0) and not a(0)) or
          (b(0) and not a(1) and not a(0));                    


end Behavioral;
