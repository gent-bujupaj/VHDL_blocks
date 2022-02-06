----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2022 03:06:45 PM
-- Design Name: 
-- Module Name: x7seg_tb - Behavioral
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
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2022 01:59:52 PM
-- Design Name: 
-- Module Name: x7seg_tb - Behavioral
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

entity x7seg_tb is
--  Port ( );
end x7seg_tb;

architecture Behavioral of x7seg_tb is
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

    constant CLK_PERIOD	: time := 10 ns;
    signal x_in:  std_logic_vector(15 downto 0);
    signal clk :  std_logic; --clock
    signal clr :  std_logic;
    signal seg :  std_logic_vector(6 downto 0); -- the bits corresponding to the LED , documentation a to g 
    signal an :  std_logic_vector(3 downto 0);
    signal dp :  std_logic;
    signal view_cnt :std_logic_vector(6 downto 0);
begin

    uut: x7seg
	port map(
          x_in => x_in,
          clr => clr,
          clk => clk,
          seg => seg,
	      an => an,
	      dp => dp,
	      view_cnt => view_cnt
    );
    
    clk_gen	: process
	begin
		clk <= '0';
		wait for CLK_PERIOD/2;
		clk <= '1';
		wait for CLK_PERIOD/2;
	end process;
	
    stimuli : process
    begin 
        clr <= '1';
        wait for 2*CLK_PERIOD;
        clr <= '0';
        x_in <= X"1234";
        wait for 200*CLK_PERIOD;
        
        clr <= '1';
        wait for 2*CLK_PERIOD;
        clr <= '0';
        x_in <= X"5678";
        wait for 200*CLK_PERIOD;
        
         clr <= '1';
         wait for 2*CLK_PERIOD;
         clr <= '0';    
         x_in <= X"0000";
         wait for 200*CLK_PERIOD;
        
        wait;
    
    end process;


end Behavioral;

