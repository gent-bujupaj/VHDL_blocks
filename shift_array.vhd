----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 06:29:04 PM
-- Design Name: 
-- Module Name: shift_array - Behavioral
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

entity shift_array is 
     Port (
        clk : in std_logic;  -- should be a low frequency clock with around ~ 3 Hz
        clr : in std_logic;
        x   : out std_logic_vector(15 downto 0) -- goes to the input of the 7seg component , can be integrated 
         );
end shift_array;

architecture Behavioral of shift_array is
signal msg_array : std_logic_vector(0 to 63);
constant phone_nr : std_logic_vector(63 downto 0) := X"248D656D1490FFFF";
begin
    process(clr, clk)
    
    begin 
        if clr = '1' then 
            msg_array <= phone_nr;
        elsif clk'event and clk = '1' then 
            msg_array(0 to 59) <= msg_array(4 to 63);
            msg_array(60 to 63) <= msg_array(0 to 3);
        end if; 
     end process;      
     x <= msg_array(0 to 15);
end Behavioral;
