----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2022 08:12:41 PM
-- Design Name: 
-- Module Name: adder_4bti_x7seg_top - Behavioral
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

entity adder_4bti_x7seg_top is
  Port ( 
    clk : in std_logic;
    btn : in std_logic_vector(3 downto 3);
    sw  : in std_logic_vector(7 downto 0);
    ld  : out std_logic_vector(0 downto 0);
    seg : out std_logic_vector(6 downto 0);
    an  : out std_logic_vector(3 downto 0);
    dp  : out std_logic
  );
end adder_4bti_x7seg_top;

architecture Behavioral of adder_4bti_x7seg_top is

component adder_4bit is
  Port ( 
    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    cf : out std_logic;
    ovf : out std_logic;
    s : out std_logic_vector(3 downto 0)
  );
  
end component;

component x7seg is
  Port ( 
    x_in: in std_logic_vector(15 downto 0);
    clk : in std_logic; --clock
    clr : in std_logic;
    seg : out std_logic_vector(6 downto 0); -- the bits corresponding to the LED , documentation a to g 
    an : out std_logic_vector(3 downto 0);
    dp : out std_logic;
    view_cnt : out std_logic_vector(6 downto 0)
    );
    
end component;

signal x : std_logic_vector(15 downto 0);
signal cf: std_logic;
signal s: std_logic_vector(3 downto 0);

begin
x(15 downto 12) <= sw(7 downto 4);
x(11 downto 8)  <= sw(3 downto 0);
x(7 downto 4)   <= "000" & cf;
x(3 downto 0)   <= s;

 adder : adder_4bit port map (a=> sw(7 downto 4), b => sw(3 downto 0), s => s, cf => cf, ovf=> ld(0));
 segment : x7seg port map ( x_in => x , clk => clk, clr => btn(3), seg => seg, an=>an , dp => dp );


end Behavioral;
