----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/06/10 09:30:56
-- Design Name: 
-- Module Name: register file - Behavioral
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
use IEEE.NUMERIC_STD.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registerfile is
  Port (
         clk: in std_logic;
         we3: in std_logic;
         ra1,ra2,wa3 : in std_logic_vector(3 downto 0);
         wd3,r15 : in std_logic_vector(15 downto 0);
         rd1,rd2: out std_logic_vector(15 downto 0)
   );
end registerfile;

architecture Behavioral of registerfile is
type ramtype is array (15 downto 0) of std_logic_vector(15 downto 0);
signal mem:ramtype;
begin
  process(clk) begin
  if rising_edge(clk) then
     if we3='1' then 
        mem(TO_INTEGER(unsigned(wa3)))<=wd3;
     end if;
  end if;
  end process;
  process(clk,we3,ra1,ra2,wa3,wd3,r15) begin
     if(TO_INTEGER(unsigned(ra1))=15) then rd1<=r15;
     else rd1<=mem(TO_INTEGER(unsigned(ra1)));
     end if;
     if(TO_INTEGER(unsigned(ra2))=15) then rd2<=r15;
     else rd2<=mem(TO_INTEGER(unsigned(ra2)));
     end if;
  end process;
end Behavioral;
