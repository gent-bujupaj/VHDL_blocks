----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2022 08:40:35 PM
-- Design Name: 
-- Module Name: adder_4bti_x7seg_top_tb - Behavioral
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

entity adder_4bti_x7seg_top_tb is
--  Port ( );
end adder_4bti_x7seg_top_tb;

architecture Behavioral of adder_4bti_x7seg_top_tb is

component adder_4bti_x7seg_top is 

  Port ( 
    clk : in std_logic;
    btn : in std_logic_vector(3 downto 3);
    sw  : in std_logic_vector(7 downto 0);
    ld  : out std_logic_vector(0 downto 0);
    seg : out std_logic_vector(6 downto 0);
    an  : out std_logic_vector(3 downto 0);
    dp  : out std_logic
  );
  
  

end component;

    constant CLK_PERIOD	: time := 10 ns;
    signal sw:      std_logic_vector(7 downto 0);
    signal btn :    std_logic;
    signal clk :    std_logic; --clock
   
    signal seg :    std_logic_vector(6 downto 0); -- the bits corresponding to the LED , documentation a to g 
    signal an :     std_logic_vector(3 downto 0);
    signal dp :     std_logic;
    signal ld :     std_logic;

begin

    utt : adder_4bti_x7seg_top port map (
        clk => clk,
        seg => seg,
	    an => an,
	    dp => dp,
	    btn(3) => btn,
	    sw => sw,
	    ld(0) => ld
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
	 btn <= '1';
     wait for 2*CLK_PERIOD;
     btn <= '0';
     sw <= "00110100";
     wait for 200*CLK_PERIOD;
     
     btn <= '1';
     wait for 2*CLK_PERIOD;
     btn <= '0';
     sw <= "10001001";
     wait for 200*CLK_PERIOD;
     
     wait;
	
	
	
	
	end process;


end Behavioral;
