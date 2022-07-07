----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/06/14 18:34:59
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
  Port ( 
         clk,reset:in std_logic;
         MemWrite: inout  std_logic
         
         );
end top;

architecture Behavioral of top is
COMPONENT ila_0

PORT (
	clk : IN STD_LOGIC;



	probe0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	probe2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
);
END COMPONENT  ;
component clk_wiz
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;


    component arm
        port(clk, reset: in STD_LOGIC;
         PC: inout STD_LOGIC_VECTOR(15 downto 0);
        Instr: in STD_LOGIC_VECTOR(31 downto 0);
        MemWrite: out STD_LOGIC;
        ALUResult,WriteData: inout STD_LOGIC_VECTOR(15 downto 0);
        ReadData: in STD_LOGIC_VECTOR(15 downto 0));
    end component;
COMPONENT imem
  PORT (
    a : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
   
COMPONENT dmem
  PORT (
    a : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    clk : IN STD_LOGIC;
    we : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
    signal WriteData,ALUResult: std_logic_vector(15 downto 0);
    signal PC: std_logic_vector(15 downto 0):="0000000000000000";
    signal Instr: std_logic_vector(31 downto 0);
    signal ReadData: std_logic_vector(15 downto 0);
    signal clk_test:std_logic;
    signal lookclk:std_logic_vector(1 downto 0);
    signal locked:std_logic;
begin
lookclk<=(clk & clk_test);

c_wiz : clk_wiz port map ( clk_out1 => clk_test,reset=>reset,locked => locked,clk_in1 => clk);
i_ila : ila_0 PORT MAP (clk => clk_test,probe0 => ReadData, probe1 => ALUResult,probe2=>PC);
i_arm: arm port map(clk=>clk_test,reset=>reset,PC=>PC,Instr=>Instr,
                        MemWrite=>MemWrite,ALUResult=>ALUResult,
                        WriteData=>WriteData,ReadData=>ReadData);
imem1:imem  PORT MAP (a => PC(10 downto 0),spo => Instr);
dmem1 : dmem  PORT MAP (
    a => ALUResult(8 downto 0),
    d =>WriteData ,
    clk => clk,
    we => MemWrite,
    spo => ReadData
  );

end Behavioral;
