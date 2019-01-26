----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2019 14:46:52
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
  GENERIC (n: INTEGER := 4);
  Port ( d_in   : in std_logic_vector(n-1 downto 0);
         clk    : in std_logic;
         clear  : in std_logic;
         up_down    : in std_logic;
         count  : in std_logic;
         load   : in std_logic;
         
         ov_flow    : out std_logic;
         q_out      : out std_logic_vector(n-1 downto 0));
end counter;

architecture Behavioral of counter is
begin
    process(clk, clear)
    variable q : std_logic_vector(n downto 0):= (others =>'0');
    begin
    
        if (clear = '1') then
            q := (others => '0');
        elsif (clk'event and clk = '1') then
            if (load = '1') then
                q(n-1 downto 0) := d_in;
                q(n) := '0';
            elsif ( count = '1') then 
                if (up_down = '1') then
                    q := q + '1';
                elsif(up_down = '0') then
                    q := q - '1';
                end if;
            end if;
        end if;
        q_out    <=  std_logic_vector(q(n-1 downto 0));
        ov_flow  <=  q(n);
   end process;
   
     

end Behavioral;
