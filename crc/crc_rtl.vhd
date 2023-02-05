----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/05/2023 04:00:25 PM
-- Design Name: 
-- Module Name: crc_rtl - Behavioral
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

entity crc_rtl is
  Port ( 
  clk : IN std_logic;
  reset_n : IN std_logic;
  enable  : IN std_logic;
  data_in : IN std_logic_vector(15 downto 0);
  crc_out : OUT std_logic_vector(15 downto 0)
  );
end crc_rtl;

architecture Behavioral of crc_rtl is
    SIGNAL data_reg : std_logic_vector(15 downto 0);
    SIGNAL counter_ctr : integer range 0 to 18;
    SIGNAL done_calc : std_logic;
    SIGNAL crc       : std_logic_vector(15 downto 0);
    
    CONSTANT poly       : std_logic_vector(15 downto 0) := "1100010110011001";
begin
 
   sample_data_reg:process (clk, reset_n)
   begin
        IF reset_n = '1' then
           data_reg <= (others => '0');      
        ELSE
          IF rising_edge(clk) THEN  
            IF enable = '1' THEN
                data_reg <= data_in;
            END IF;
          END IF;      
        END IF;    
   end process; 
   
   crc_calculation:process (clk, reset_n)
      variable intermediate: std_logic_vector(15 downto 0);
   begin
        IF reset_n = '1' then
           crc <= (others => '0');      
        ELSE
             IF rising_edge(clk) THEN
                IF counter_ctr = 1 THEN
                    crc <= data_reg;
                ELSE 
                    IF counter_ctr >= 1 AND counter_ctr < 17 THEN
                        IF crc(15) = poly (15) then
                            intermediate := crc XOR poly;
                            crc(15 downto 1) <= intermediate(14 downto 0);
                            crc(0) <= '0';
                        ELSE
                            intermediate := crc XOR "0000000000000000";                        
                            crc(15 downto 1) <= intermediate(14 downto 0);
                            crc(0) <= '0';
                        
                        END IF;
                    ELSIF counter_ctr = 17 then
                       crc <= crc XOR poly; 
                    END IF;                    
                END IF;
         END IF;       
        END IF;    
   end process; 
   
   counter:process (clk, reset_n)
   begin
        IF reset_n = '1' then
           counter_ctr <= 0;      
        ELSE
            IF rising_edge(clk) THEN
                IF  enable = '1' then
                    counter_ctr <= 1;      
                ELSIF counter_ctr >= 1 AND counter_ctr < 17 THEN
                    counter_ctr <= counter_ctr + 1;
                ELSIF counter_ctr = 17 then
                    counter_ctr <= 0;
                END IF;
            END IF;
        END IF;    
   end process; 
   
   done:process (clk, reset_n)
   begin
        IF reset_n = '1' then
           done_calc <= '0';      
        ELSE
            IF rising_edge(clk) THEN
                IF counter_ctr = 17 THEN
                    done_calc <= '1';
                else
                    done_calc <= '0';    
                END IF;
            END IF;       
        END IF;    
   end process;
   crc_out <= crc;
   


end Behavioral;
