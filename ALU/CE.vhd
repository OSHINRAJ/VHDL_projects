----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2018 23:29:14
-- Design Name: 
-- Module Name: CE - Behavioral
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

entity CE is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           c0 : out STD_LOGIC);
end CE;

architecture Behavioral of CE is

begin
process(S)
    begin
        if ( S = "101") then
            c0 <= '1';
        elsif ( S = "111") then
            c0 <= '1';            
        else
            c0 <= '0';
        end if;
    end process; 

end Behavioral;
