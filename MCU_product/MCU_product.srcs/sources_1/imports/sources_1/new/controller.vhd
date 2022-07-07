----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/06/10 21:23:47
-- Design Name: 
-- Module Name: controller - Behavioral
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

entity controller is
 Port ( 
        clk,reset :in std_logic;
        Instr: in std_logic_vector(31 downto 12);
        ALUFlags: in std_logic_vector(3 downto 0);
        RegSrc: inout std_logic_vector(1 downto 0);
        RegWrite: out std_logic;
        ImmSrc: out std_logic_vector(1 downto 0);
        ALUSrc: out std_logic;
        ALUControl: inout std_logic_vector(2 downto 0);
        MemWrite: out std_logic;
        MemtoReg: out std_logic;
        PCSrc: out std_logic
        );
end controller;

architecture Behavioral of controller is
    component decoder  Port (
         Op: in std_logic_vector(1 downto 0);
         Funct: in std_logic_vector(5 downto 0);
         Rd: in std_logic_vector(3 downto 0);
         FlagW: out std_logic_vector(1 downto 0);
         PCS,RegW,MemW: inout std_logic;
         MemtoReg,ALUSrc: out std_logic;
         ImmSrc,RegSrc: out std_logic_vector(1 downto 0);
         ALUControl: inout std_logic_vector(2 downto 0)
          );
        end component;
        component condlogic 
        port(
        clk, reset:in STD_LOGIC;
        Cond:in STD_LOGIC_VECTOR(3 downto 0);
        ALUFlags:in STD_LOGIC_VECTOR(3 downto 0);
        Flagw:in STD_LOGIC_VECTOR( 1 downto 0);
        PcS,Regw,MemW: in STD_LOGIC;
        Pcsrc,Regwrite:out STD_LOGIC;
        MemWrite:out STD_LOGIC);
        end component;
       signal FlagW:std_logic_vector(1 downto 0);
       signal PCS,REGW,MemW:std_logic;
begin
       dec:decoder port map(
                             op=>Instr(27 downto 26),Funct=>Instr(25 downto 20),RD=>Instr(15 downto 12),
                             FlagW=>FlagW,PCS=>PCS,RegW=>RegW,MemW=>MemW,
                             MemtoReg=>MemtoReg,ALUSrc=>ALUSrc,ImmSrc=>ImmSrc,
                             RegSrc=>RegSrc,ALUControl=>ALUControl
                             );
       cl:condlogic port map(
                              clk=>clk,reset=>reset,Cond=>Instr(31 downto 28),
                              ALUFlags=>ALUFlags,FlagW=>FlagW,PCS=>PCS,RegW=>RegW,
                              MemW=>MemW,PCSrc=>PCSrc,RegWrite=>RegWrite,MemWrite=>MemWrite
                             );

end Behavioral;
