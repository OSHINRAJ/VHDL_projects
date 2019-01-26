----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2018 23:10:31
-- Design Name: 
-- Module Name: AE - Behavioral
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

entity AE is
    generic (n: integer := 8);
    Port ( B : in STD_LOGIC_VECTOR (n-1 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (n-1 downto 0));
end AE;

architecture Behavioral of AE is
begin
    process(S, B)
    begin
        if ( S = "100") then
            y <= B;
        elsif ( S = "101") then
            y <= B;
        elsif ( S = "110") then
            y <= "00000001";     
        elsif ( S = "111") then
            y <= "00000001";            
        else
            y <= "00000000";
        end if;
    end process; 
end Behavioral;
