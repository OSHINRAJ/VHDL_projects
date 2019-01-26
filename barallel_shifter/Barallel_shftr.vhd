----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2018 14:37:23
-- Design Name: 
-- Module Name: Barallel_shftr - Behavioral
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

entity Barallel_shftr is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
end Barallel_shftr;

architecture structural of Barallel_shftr is
component mux4_1 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           I2 : in STD_LOGIC;
           I3 : in STD_LOGIC;
           s : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC);
end component;

begin
    U0:mux4_1 port map(x(0),x(3),x(2),x(1),sel,output(0));
    U1:mux4_1 port map(x(1),x(0),x(3),x(2),sel,output(1));
    U2:mux4_1 port map(x(2),x(1),x(0),x(3),sel,output(2));
    U3:mux4_1 port map(x(3),x(2),x(1),x(0),sel,output(3));
end structural;
