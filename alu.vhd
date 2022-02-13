----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2022 10:01:19 PM
-- Design Name: 
-- Module Name: alu - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
  Port (
    alu_select : in std_logic_vector(2 downto 0);
    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    nf : out std_logic;  -- negative flag 
    zf : out std_logic;  -- zero flag
    cf : out std_logic;   -- carry flag 
    ovf: out std_logic;  -- overflow flag
    y  : out std_logic_vector(3 downto 0)
    
   );

end alu;

architecture Behavioral of alu is

begin

    process(a,b, alu_select)
    
    variable temp: std_logic_vector(4 downto 0);
    variable yv : std_logic_vector(3 downto 0); -- variable of size of output 
    variable cfv, zfv :  std_logic; -- variables for cf and zf
    
    begin
        cf  <= '0';
        ovf <= '0';
        temp := "00000";
        zfv  := '0';
        
        case alu_select is                                -- pass a 
        when "000"  => 
               yv:= a;                          
        when "001"  =>                                     -- a + b
              temp := ('0' & a) + ('0' & b);
              yv   := temp(3 downto 0);
              cfv  := temp(4);
              ovf  <= yv(3) xor a(3) xor b(3) xor cfv; -- calculation of the overflow flag
              cf <= cfv;
        when "010"  =>                                      -- a - b
              temp := ('0' & a) - ('0' & b);
              yv   := temp(3 downto 0);
              cfv  := temp(4);
              ovf  <= yv(3) xor a(3) xor b(3) xor cfv; -- calculation of the overflow flag
              cf <= cfv;
         when "011" =>                                      -- b - a 
              temp := ('0' & b) - ('0' & a);
              yv   := temp(3 downto 0);
              cfv  := temp(4);
              ovf  <= yv(3) xor a(3) xor b(3) xor cfv; -- calculation of the overflow flag
              cf <= cfv;                                              
         when "100" =>                                      -- NOT                      
                yv := not a;
         when "101" =>                                      -- AND                     
                yv := a and b;
         when "110" =>                                      -- OR                     
                yv := a or  b;
         when "111" =>                                      -- XOR                      
                yv := a xor b;
         when others => 
                yv := a;                            
        end case;
        
        for i in 0 to 3 loop
            zfv := zfv or yv(i);         -- check if all the elements on y are zero then set the zero flag below 
        end loop;
        y  <= yv;
        zf <= not zfv;
        nf <= yv(3);    
    end process;
    


end Behavioral;
