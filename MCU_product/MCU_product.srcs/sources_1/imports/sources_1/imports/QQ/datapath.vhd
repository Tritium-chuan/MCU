library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath is
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
        ALUResult, WriteData: inout STD_LOGIC_VECTOR(15 downto 0);
        ReadData:in STD_LOGIC_VECTOR(15 downto 0));
end datapath;

architecture Behavioral of datapath is
    component alu is
    port(a,b:in STD_LOGIC_VECTOR(15 downto 0);
        ALUControl: in STD_LOGIC_VECTOR(2 downto 0);
        Result:inout STD_LOGIC_VECTOR(15 downto 0);
        ALUFlags:out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component registerfile is
    port(clk:in STD_LOGIC;
        we3:in STD_LOGIC;
        ra1,ra2,wa3: in STD_LOGIC_VECTOR(3 downto 0);
        wd3,r15:in STD_LOGIC_VECTOR(15 downto 0);
        rd1,rd2:out STD_LOGIC_VECTOR(15 downto 0));
    end component;
    
    component adder is
    port(a,b: in STD_LOGIC_VECTOR(15 downto 0);
        y:out STD_LOGIC_VECTOR(15 downto 0));
    end component;
    
    component extend is
    port(Instr:in STD_LOGIC_VECTOR(23 downto 0);
        ImmSrc: in STD_LOGIC_VECTOR(1 downto 0);
        ExtImm: out STD_LOGIC_VECTOR(15 downto 0));
    end component;
    
    component flopr is
    generic(width: integer) ;
    port(clk, reset: in STD_LOGIC;
        d:in STD_LOGIC_VECTOR(width-1 downto 0);
        q:out STD_LOGIC_VECTOR(width-1 downto 0));
    end component ;
    
    component mux2 generic(width: integer);
    port(d0, d1: in STD_LOGIC_VECTOR(width-1 downto 0);
            S:in STD_LOGIC;
            y:out STD_LOGIC_VECTOR(width-1 downto 0));
    end component;
    
    signal PCNext, PCPlus4, PCP1us8:STD_LOGIC_VECTOR(15 downto 0);
    signal ExtImm, Result: STD_LOGIC_VECTOR(15 downto 0);
    signal SrcA, SrcB:STD_LOGIC_VECTOR(15 downto 0);
    signal RA1, RA2:STD_LOGIC_VECTOR(3 downto 0);

begin
    --next PClogic
    pcmux: mux2 generic map(16) port map(
        d0 => PCPlus4, 
        d1 => Result, 
        s => PCSrc, 
        y => PCNext);
    pcreg: flopr generic map(16) port map(
        clk => clk, 
        reset => reset, 
        d => PCNext, 
        q => PC);
    pcadd1: adder port map(
        a => PC,
        b => "0000000000000001", 
        y => PCPlus4);
    pcadd2: adder port map(
       a => PCPlus4, 
       b => "0000000000000001",
       y =>PCP1us8);
    -- register file logic
    ralmux: mux2 generic map(4) port map(
        d0 => Instr(19 downto 16),
        d1 => "1111",
        s => RegSrc(0), 
        y => RA1);
    ra2mux: mux2 generic map(4) port map( 
        d0 => Instr(3 downto 0),
        d1 => Instr(15 downto 12),
        s => RegSrc(1),
        y => RA2);
    rf: registerfile port map(
        clk => clk,
        we3 => RegWrite,
        ra1 => RA1,
        ra2 => RA2,
        wa3 => Instr(15 downto 12),
        wd3 => Result,
        r15 => PCP1us8, 
        rd1 => SrcA,
        rd2 => WriteData);
    resmux: mux2 generic map(16) port map(
        d0 => ALUResult,
        d1 => ReadData,
        s => MemtoReg, 
        y => Result);
    ext: extend port map(
        instr => Instr(23 downto 0),
        immsrc => ImmSrc,
        extimm => ExtImm);
    --ALU logic
    srcbmux: mux2 generic map(16) port map(
        d0 => WriteData, 
        d1 => ExtImm, 
        s => ALUSrc, 
        y => SrcB);
    i_alu: alu port map(
        a => SrcA,
        b => SrcB,
        ALUcontrol => ALUControl,
        Result => ALUResult,
        ALUFlags => ALUFlags);

end Behavioral;
