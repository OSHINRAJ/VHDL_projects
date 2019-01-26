----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2018 23:25:00
-- Design Name: 
-- Module Name: LE - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LE is
    generic (n :integer := 8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           x : out STD_LOGIC_VECTOR (n-1 downto 0));
end LE;

architecture Behavioral of LE is

begin
process(S, A, B)
    begin
        if ( S = "000") then
            x <= A;
        elsif ( S = "001") then
            x <= A and B;
        elsif ( S = "010") then
            x <= A or B;
        elsif ( S = "011") then
            x <= not A;         
        else
            x <= A;
        end if;
    end process; 

end Behavioral;
