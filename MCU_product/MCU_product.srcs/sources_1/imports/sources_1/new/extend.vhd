----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/06/10 10:15:31
-- Design Name: 
-- Module Name: extend - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity extend is
  Port (
         Instr: in std_logic_vector(23 downto 0);
         ImmSrc:in std_logic_vector(1 downto 0);
         ExtImm: out std_logic_vector(15 downto 0)
          );
end extend;

architecture Behavioral of extend is

begin
   process(Instr,ImmSrc) begin
       case ImmSrc is
           when"00"=>ExtImm<=(X"00"&Instr(7 downto 0));
           when"01"=>ExtImm<=(X"0"&Instr(11 downto 0));
           when"10"=>ExtImm<=(Instr(10)&Instr(10)&
                              Instr(10)&Instr(10 downto 0)&"00");
           when others=> ExtImm<=X"0000";
           end case;
       end process;
end Behavioral;
