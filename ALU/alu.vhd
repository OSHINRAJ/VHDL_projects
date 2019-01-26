----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2018 22:38:46
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    generic (n : integer := 8); 
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           F : out STD_LOGIC_VECTOR (n-1 downto 0);
           un_sgn_ov    : out STD_LOGIC;
           sgn_ov       : out STD_LOGIC);
end alu;

architecture Structural of alu is
signal regA, regB   :   STD_LOGIC_VECTOR (n-1 downto 0);
signal regS         :   STD_LOGIC;

component add_sub is
    generic(n: INTEGER := 8);
    Port (A : IN STD_LOGIC_VECTOR(n-1 downto 0);
          B : IN STD_LOGIC_VECTOR(n-1 downto 0);
          S : IN STD_LOGIC;
          F : OUT STD_LOGIC_VECTOR(n-1 downto 0);
          unsigned_overflow : OUT STD_LOGIC;
          signed_overflow   : OUT STD_LOGIC);
end component;
component LE is
    generic(n: INTEGER := 8);
    Port (A : IN STD_LOGIC_VECTOR(n-1 downto 0);
          B : IN STD_LOGIC_VECTOR(n-1 downto 0);
          S : in STD_LOGIC_VECTOR (2 downto 0);
          x : OUT STD_LOGIC_VECTOR(n-1 downto 0));
end component;
component AE is
    generic(n: INTEGER := 8);
    Port (B : IN STD_LOGIC_VECTOR(n-1 downto 0);
          S : in STD_LOGIC_VECTOR (2 downto 0);
          y : OUT STD_LOGIC_VECTOR(n-1 downto 0));
end component;
component CE is
    Port (S : IN STD_LOGIC_VECTOR (2 downto 0);
          c0 : OUT STD_LOGIC);
end component;

begin
U1: LE port map(A, B, S, regA);
U2: AE port map(B, S, regB);
U3: CE port map(S, regS);
U4: add_sub port map(regA, regB, regS, F, un_sgn_ov, sgn_ov);

end Structural;
