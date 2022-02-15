----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2022 07:17:44 PM
-- Design Name: 
-- Module Name: debounce4 - Behavioral
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

entity debounce4 is -- debounce 4 pushbuttons used if we implement pushbuttons of the fpga .
 Port (
    inp : in std_logic_vector(3 downto 0);
    cclk: in std_logic; -- clock with low freuqency ~ 90 Hz , keep this in mind
    clr : in std_logic;
    outp: out std_logic_vector(3 downto 0)
  );

end debounce4;

architecture Behavioral of debounce4 is
signal delay1, delay2, delay3: std_logic_vector(3 downto 0);
begin 
    process (cclk, clr)
    begin 
        if clr = '1' then
            delay1 <= "0000";
            delay2 <= "0000";
            delay3 <= "0000";
        elsif cclk'event and cclk= '1' then
            delay1<= inp;
            delay2<= delay1;
            delay3<= delay2;
        end if;
    end process;          
    outp<= delay1 and delay2 and delay3;


end Behavioral;
