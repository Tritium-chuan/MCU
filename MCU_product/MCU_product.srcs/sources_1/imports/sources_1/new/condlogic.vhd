Library IEEE;
use IEEE.STD_LOGIC_1164.aLL;
entity condlogic is--Conditional logic
port(
        clk, reset:in STD_LOGIC;
        Cond:in STD_LOGIC_VECTOR(3 downto 0);
        ALUFlags:in STD_LOGIC_VECTOR(3 downto 0);
        Flagw:in STD_LOGIC_VECTOR( 1 downto 0);
        PcS,Regw,MemW: in STD_LOGIC;
        Pcsrc,Regwrite:out STD_LOGIC;
        MemWrite:out STD_LOGIC);
end;
architecture Behavioral of condlogic is
    component condcheck
        port(
                Cond :in STD_LOGIC_VECTOR(3 downto 0);
                Flags:in STD_LOGIC_VECTOR(3 downto 0);
                condEX:out STD_LOGIC);
        end component;
    component flopenr generic(width: integer);
        port(clk,reset, en: in STD_LOGIC;
                d:in std_logic_vector(width-1 downto 0);
                q:out STD_LOGIC_VECTOR (width-1 downto 0));
        end component;
signal FlagWrite:STD_LOGIC_VECTOR(1 downto 0);
signal Flags: std_logic_vector (3 downto 0);
signal condEx:STD_LOGIC;
    begin
        flagregl:flopenr generic map(2)
        port map(clk=>clk,reset=>reset,en=> FlagWrite(1),d=>ALUFlags(3 downto 2),q=>Flags(3 downto 2));

        flagreg0: flopenr generic map(2)
        port map(clk=>clk,reset=>reset,en=>FlagWrite(0),d=>ALUFlags(1 downto 0),q=>Flags(1 downto 0));

        cc: condcheck port map(Cond=>Cond,Flags=>Flags , CondEx=>CondEx);
    FlagWrite<=FLagW and (CondEx,CondEx);
    RegWrite<=RegW and CondEx;
    MemWrite<= MemW and CondEx;
    PCSrc<=PCS and CondEx;
    end;
