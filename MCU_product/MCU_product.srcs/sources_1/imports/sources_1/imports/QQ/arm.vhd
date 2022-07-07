library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arm is
    port(clk, reset: in STD_LOGIC;
         PC: inout STD_LOGIC_VECTOR(15 downto 0);
        Instr: in STD_LOGIC_VECTOR(31 downto 0);
        MemWrite: out STD_LOGIC;
        ALUResult,WriteData: inout STD_LOGIC_VECTOR(15 downto 0);
        ReadData: in STD_LOGIC_VECTOR(15 downto 0));
end arm;

architecture Behavioral of arm is
    component controller is
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
        PCSrc: out std_logic);
    end component ;

    component datapath is
     port(clk, reset:in STD_LOGIC;
        RegSrc:in STD_LOGIC_VECTOR(1 downto 0);
        RegWrite:in STD_LOGIC;
        ImmSrc:in STD_LOGIC_VECTOR(1 downto 0);
        ALUSrc:in STD_LOGIC;
        ALUControl:in STD_LOGIC_VECTOR(2 downto 0);
        MemtoReg:in STD_LOGIC;
        PCSrc:in STD_LOGIC;
        ALUFlags:out STD_LOGIC_VECTOR(3 downto 0);
        PC:inout STD_LOGIC_VECTOR(15 downto 0);
        Instr:in STD_LOGIC_VECTOR(31 downto 0);
        ALUResult, WriteData:inout STD_LOGIC_VECTOR(15 downto 0);
        ReadData:in STD_LOGIC_VECTOR(15 downto 0));
    end component;
    
    signal RegWrite,ALUSrc,MemtoReg,PCSrc: STD_LOGIC;
    signal RegSrc,ImmSrc: STD_LOGIC_VECTOR(1 downto 0);
    signal  ALUControl:std_logic_vector(2 downto 0);
    signal ALUFlags: STD_LOGIC_VECTOR(3 downto 0);

begin
    cont: controller port map(
        clk => clk, 
        reset => reset, 
        Instr => Instr(31 downto 12),
        ALUFlags => ALUFlags,
        RegSrc => RegSrc, 
        RegWrite => RegWrite,
        ImmSrc => ImmSrc,
        ALUSrc => ALUSrc,
        ALUControl => ALUControl,
        MemWrite => MemWrite,
        MemtoReg => MemtoReg, 
        PCSrc => PCSrc);
    dp: datapath port map(
        clk => clk,
        reset => reset,
        RegSrc => RegSrc,
        RegWrite => RegWrite, 
        ImmSrc => ImmSrc,
        ALUSrc => ALUSrc,
        ALUControl => ALUControl,
        MemtoReg => MemtoReg,
        PCSrc => PCSrc,
        ALUFlags => ALUFlags,
        PC => PC,
        Instr => Instr,
        ALUResult => ALUResult,
        WriteData => WriteData,
        ReadData => ReadData);
end Behavioral;
