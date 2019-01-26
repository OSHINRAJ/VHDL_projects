----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2018 11:12:16
-- Design Name: 
-- Module Name: add_sub - Behavioral
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

entity add_sub is
generic(n: INTEGER := 8);
Port (A : IN STD_LOGIC_VECTOR(n-1 downto 0);
      B : IN STD_LOGIC_VECTOR(n-1 downto 0);
      S : IN STD_LOGIC;
      F : OUT STD_LOGIC_VECTOR(n-1 downto 0);
      unsigned_overflow : OUT STD_LOGIC;
      signed_overflow   : OUT STD_LOGIC);
end add_sub;

architecture Behavioral of add_sub is
signal result   : STD_LOGIC_VECTOR(n downto 0);
signal c        : STD_LOGIC_VECTOR(n-1 downto 0);

begin
    process(S, A, B)
    begin
        if (S = '0') then
            result <= ('0' & A) + ('0' & B);
            c <= ('0' & A(n-2 downto 0)) + ('0' & B(n-2 downto 0));
        else
            result <= ('0' & A) - ('0' & B);
            c <= ('0' & A(n-2 downto 0)) - ('0' & B(n-2 downto 0));
        end if;
        end process; 
        F <= result(n-1 downto 0);
        unsigned_overflow <= result(n);
        signed_overflow <= result(n) xor c(n-1);             
end Behavioral;
