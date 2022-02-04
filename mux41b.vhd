----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2022 09:25:23 AM
-- Design Name: 
-- Module Name: mux41b - Behavioral
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

entity mux41b is
  Port (
  c: in std_logic_vector(3 downto 0);
  s: in std_logic_vector(1 downto 0);
  z: out std_logic
  
   );
  
end mux41b;

architecture Behavioral of mux41b is

component mux21b is 
 Port (
   a: in std_logic;
   b: in std_logic;
   s: in std_logic;
   y: out std_logic
   );
end component;   
signal g: std_logic;
signal h: std_logic;
begin

Block1: mux21b 
    port map (
    a=> c(0),
    b=> c(1),
    s=> s(0),
    y=> g
);

Block2: mux21b 
    port map (
    a=> c(2),
    b=> c(3),
    s=> s(0),
    y=> h
);

Block3: mux21b 
    port map (
    a=> g,
    b=> h,
    s=> s(1),
    y=> z
);
end Behavioral;
