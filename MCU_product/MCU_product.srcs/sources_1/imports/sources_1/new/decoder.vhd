----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/06/10 11:15:35
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
  Port (
         Op: in std_logic_vector(1 downto 0);
         Funct: in std_logic_vector(5 downto 0);
         Rd: in std_logic_vector(3 downto 0);
         FlagW: out std_logic_vector(1 downto 0);
         PCS,RegW,MemW: inout std_logic;
         MemtoReg,ALUSrc: out std_logic;
         ImmSrc,RegSrc: out std_logic_vector(1 downto 0);
         ALUControl: inout std_logic_vector(2 downto 0)
          );
end decoder;

architecture Behavioral of decoder is

signal controls:std_logic_vector(9 downto 0);
signal ALUOp, Branch:STD_LOGIC;
signal op2:STD_LOGIC_VECTOR(3 downto 0);
begin
  op2 <= (Op&Funct(5)&Funct(0));
    process(op,funct,rd,op2,ALUOp,Branch) begin 
        case op2 is
            when "0000"=> controls <= "0000001001";
            when "0001"=> controls <= "0000001001";
            when "0010"=> controls <="0000101001";
            when "0011"=> controls <="0000101001";
            when"0100" => controls <= "1001110100";
            when"0110" => controls <= "1001110100";
            when "0101"=> controls <= "0001111000";
            when "0111"=> controls <= "0001111000";
            when"10--"=>controls <= "0110100010";
            when others =>controls <= "----------";
        end case;
    end process ;
  
  RegSrc(1 downto 0)<="10" when Funct="111010" else controls(9 downto 8);

  Immsrc(1 downto 0) <= controls(7 downto 6);
  ALUSrc<=controls(5);
  MemtoReg<=controls(4);
  RegW<=controls(3);
  MemW<=controls(2);
  Branch<=controls(1);
  ALUop<=controls(0);
  process(op,funct,rd,op2,ALUOp,Branch) begin 
    if (ALUOp='1') then
        case Funct(4 downto 1) is
            when"0100"=>ALUControl <= "000";-- ADD
            when"0010" => ALUControl<= "001"; -- SUB
            when "0000" => ALUControl <="010"; --AND
            when "1100" =>ALUControl <= "011"; -- ORR
            when "1101" =>ALUControl<="110";--MOV
            when"1000"  =>ALUControl<="111" ;  --multiple
            when others => ALUControl <= "---"; 
        end case;
      FlagW(1) <= Funct(0);
      FlagW(0) <=Funct(0) and (not ALUControl(1));
    else
        ALUControl <= "000";
        FlagW <= "00";
    end if ;
  end process;
 PCS<=((Rd(3)and Rd(2) and Rd(1) and Rd(0)) and RegW) or Branch;
end;