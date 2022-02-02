----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2022 09:14:02 AM
-- Design Name: 
-- Module Name: comp2bit_tb - Behavioral
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

entity comp2bit_tb is
--  Port ( );
end comp2bit_tb;

architecture Behavioral of comp2bit_tb is

component comp2bit is
  Port ( 
  a : in std_logic_vector(1 downto 0);
  b : in std_logic_vector(1 downto 0);
  a_lt_b : out std_logic;
  a_gt_b : out std_logic;
  a_eq_b : out std_logic
  );
end component;

        signal a : std_logic_vector(1 downto 0);
        signal b : std_logic_vector(1 downto 0);
        signal a_lt_b :  std_logic;
        signal a_gt_b :  std_logic;
        signal a_eq_b :  std_logic;
        
        type test_vector is record
             a : std_logic_vector(1 downto 0);
             b : std_logic_vector(1 downto 0);

        end record;
        ------------------------------------------------

        ---------------------------------------------------------
    type test_vector_array is array (natural range <>) of test_vector;
    constant test_vectors : test_vector_array := (
        -- a, b, sum , carry   -- positional method is used below
        ("00", "00"), --
        ("00", "01"), --
        ("00", "10"), --
        ("00", "11"), --
        ("01", "00"), --
        ("01", "01"), --
        ("01", "10"), --
        ("01", "11"), --
        ("10", "00"), --
        ("10", "01"), --
        ("10", "10"), --
        ("10", "11"), --
        ("11", "00"), --
        ("11", "01"), --
        ("11", "10"), --
        ("11", "11")
        
        );
        
begin

     UUT : comp2bit port map (a => a, b => b, a_lt_b=> a_lt_b, a_gt_b => a_gt_b, a_eq_b => a_eq_b);
     
       tb1 : process
    begin
        for i in test_vectors'range loop
            a <= test_vectors(i).a;  
            b <= test_vectors(i).b;

            wait for 20 ns;
           end loop;
        wait;
    end process;     
     


end Behavioral;
