----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2022 10:23:12 PM
-- Design Name: 
-- Module Name: mux7seg_top - Behavioral
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
-- btn3 ,  btn2 , btn1 , btn0 | s1   s0
------------------------------------------
--  0       0      0      0   | X    X
--  0       0      0      1   | 0    0
--  0       0      1      0   | 0    1
--  0       1      0      0   | 1    0
--  1       0      0      0   | 1    1   
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux7seg_top is
  Port (
    btn : in std_logic_vector(3 downto 0);
    seg : out std_logic_vector(6 downto 0);
    an  : out std_logic_vector(3 downto 0);
    dp  : out std_logic
   );
end mux7seg_top;

architecture Behavioral of mux7seg_top is
signal x: std_logic_vector(15 downto 0);
signal s: std_logic_vector(1 downto 0);
signal digit: std_logic_vector(3 downto 0);
begin
    x <= x"1234";
    an <= not btn;
    s(1) <= btn(2) or btn(3);   --------------- buttons affecting the selct value of the MUX and also the anodes 
    s(0) <= btn(1) or btn(3);   ------------- 
    dp <= '1';
    MUX_4to1: process(s)
    begin
        case s is 
        when "00" => digit <= x(3 downto 0);
        when "01" => digit <= x(7 downto 4);
        when "10" => digit <= x(11 downto 8);
        when others  => digit <= x(15 downto 12);
        end case;

    
    end process;
    
     process(digit)
	begin
		case digit is
			when "0000" => -- 
			seg <= "0000001"; --0  MSB is the a of the 7seg, LSB is the g of the 7seg 
			when "0001" =>
			seg <= "1001111"; --1  
			when "0010" =>
			seg <= "0010010"; --2  
			when "0011" =>
			seg <= "0000110"; --3  
			when "0100" =>
			seg <= "1001100"; --4  
			when "0101" =>
			seg <= "0100100"; --5  
			when "0110" =>
			seg <= "0100000"; --6  
			when "0111" =>
			seg <= "0001101"; --7  
			when "1000" =>
			seg <= "0000000"; --8  
			when "1001" =>
			seg <= "0000100"; --9  
			when "1010" =>
			seg <= "0001000"; --A  
			when "1011" =>
			seg <= "1100000"; --B  
			when "1100" =>
			seg <= "0110001"; --C  
			when "1101" =>
			seg <= "1000010"; --D  
			when "1110" =>
			seg <= "0110000"; --E  
			when "1111" =>
			seg <= "0111000"; --F  
			when others =>
			seg <= "0000000"; --turn off the digit
        end case;
	end process;



end Behavioral;
