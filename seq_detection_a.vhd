----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/17/2022 07:41:56 PM
-- Design Name: 
-- Module Name: seq_detection_a - Behavioral
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

entity seq_detection_a is
      Port (
        clk : in std_logic;
        clr : in std_logic;
        din : in std_logic;
        dout: out std_logic
         );
end seq_detection_a;
-- detect 1101 with Moore machine 

architecture Behavioral of seq_detection_a is
type state_type is (s0, s1, s2, s3, s4);
signal present_state, next_state : state_type;
begin
    state_reg: process(clk, clr)  --- sequential process 
    begin 
        if clr = '1' then 
            present_state <= s0;
        elsif clk'event and clk = '1' then 
            present_state <= next_state;
            
        end if; 
    
    end process;
    
    state_machine:process(present_state, din)
    begin 
        case present_state is
            when s0 =>
                if din = '1' then  -- 1
                    next_state <= s1;
                else
                    next_state <= s0;
                end if;
            when s1 =>
                if din = '1' then  -- 1
                    next_state <= s2;
                else
                    next_state <= s0;
                end if;
            when s2 =>
                if din = '0' then  -- 0
                    next_state <= s3;
                else
                    next_state <= s2;
                end if;
            when s3 =>
                if din = '1' then  -- 1
                    next_state <= s4;
                else
                    next_state <= s0;
                end if;    
            when s4 =>
                if din = '0' then 
                    next_state <= s0;
                else
                    next_state <= s2;      
                end if;
            when others => NULL;
            end case;                       
    end process;
    
    
    output: process( present_state ) -- since this is moore machine it only depends on the present state 
    
       begin
           if present_state = s4 then
                dout <= '1';
           else
                dout <= '0';
           end if;   
       
       end process; 

end Behavioral;
