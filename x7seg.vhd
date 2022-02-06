----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2022 12:36:09 PM
-- Design Name: 
-- Module Name: x7seg - Behavioral
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
use IEEE.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity x7seg is
  Port ( 
    x_in: in std_logic_vector(15 downto 0);
    clk : in std_logic; --clock
    clr : in std_logic;
    seg : out std_logic_vector(6 downto 0); -- the bits corresponding to the LED , documentation a to g 
    an : out std_logic_vector(3 downto 0);
    dp : out std_logic;
    view_cnt : out std_logic_vector(6 downto 0)
    );
    
end x7seg;

architecture Behavioral of x7seg is
signal mux_select : std_logic_vector(1 downto 0);
signal set_s : std_logic;
signal clr_count : std_logic;
signal digit : std_logic_vector(3 downto 0);
signal aen : std_logic_vector(3 downto 0); -- for turning on or off specific annode 
signal clkdiv: std_logic_vector(6 downto 0); -- siignal for clock divider, only a 21 bit vector is allocated 

 type t_state is (zero, one, two, three);
 signal state   : t_state;

begin
    --s <= clkdiv(6 downto 5); -- we feed the 2 top most bits to the select of the MUX, top 2 bits count at 190 Hhz
    -- in this case all annodes are enabled 
    dp <= '1'; -- turned off 
    
    process(set_s)
    begin
    case state is 
    when zero =>
    if set_s = '1' then 
           mux_select <= "00";
           an <= "1110";
           state <= one;
     end if;

    when one  =>
    if set_s = '1' then 
           mux_select <= "01";
           an <= "1101";
           state <= two;
     end if;
    when two  =>
    if set_s = '1' then 
           mux_select <= "10";
           an <= "1011";
           state <= three;
     end if;
    when three=>
    if set_s = '1' then 
           mux_select <= "11";
           an <= "0111";
           state <= zero;
     end if;
     end case;    
    
    end process;
    
    MUX_4to1: process(mux_select)
    begin
        case mux_select is 
        when "00" => digit <= x_in(3 downto 0);
        when "01" => digit <= x_in(7 downto 4);
        when "10" => digit <= x_in(11 downto 8);
        when others  => digit <= x_in(15 downto 12);
        end case;
    end process;
     -- 7 segment decoder 
    process(digit)
	begin
		case digit is
			when "0000" => seg <= "0000001"; --0  MSB is the a of the 7seg, LSB is the g of the 7seg 
			when "0001" => seg <= "1001111"; --1  
			when "0010" => seg <= "0010010"; --2  
			when "0011" => seg <= "0000110"; --3  
			when "0100" => seg <= "1001100"; --4  
			when "0101" => seg <= "0100100"; --5  
			when "0110" => seg <= "0100000"; --6  
			when "0111" => seg <= "0001101"; --7  
			when "1000" => seg <= "0000000"; --8  
			when "1001" => seg <= "0000100"; --9  
			when "1010" => seg <= "0001000"; --A  
			when "1011" => seg <= "1100000"; --B  
			when "1100" => seg <= "0110001"; --C  
			when "1101" => seg <= "1000010"; --D  
			when "1110" => seg <= "0110000"; --E  
			when "1111" => seg <= "0111000"; --F  
			when others => seg <= "0000000"; --turn off the digit
        end case;
	end process;
	
	-- turn off a specific digit.default ancdoe
	--process (s, aen)
	--begin 
	--   an <= "1111";
	--   if aen(conv_integer(s)) = '1'then
	 --    an(conv_integer(s)) <= '0';  -- this works, tried to use to_integer(unsigned(s), would give a syntax error ~~
	 -- end if;  
    --	end process;

    process (clk, clr) -- clock divider , counter circuit 
    begin 
        if clr = '1' or clr_count = '1' then
            clkdiv <= (others => '0');
            set_s <= '0';
            clr_count <= '0';
        elsif clk'event and clk = '1' then
            if clkdiv = "1010" then --- make a counter / timer to the value A/ 10 
               set_s <= '1';
               clr_count <= '1';
            else 
               set_s <= '0';
               clr_count <= '0';
               clkdiv <= clkdiv + 1;
            end if;   
        end if;
     end process;
     
     view_cnt <= clkdiv;            
end Behavioral;
