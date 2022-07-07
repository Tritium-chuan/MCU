library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
 Port (
        a,b : in std_logic_vector(15 downto 0);   
        ALUControl :   in std_logic_vector(2 downto 0);
        Result : out std_logic_vector(15 downto 0);
        ALUFlags : out std_logic_vector(3 downto 0) 
       );
end ALU;

architecture Behavioral of ALU is
signal A33, B33, Tmp: std_logic_vector(16 downto 0);
signal V32, C32, N32, Z32 : std_logic;
signal sum,mult : std_logic_vector(15 downto 0);
signal resul : std_logic_vector(15 downto 0);
signal Cout32 : std_logic;
signal V1, V2, V3, C1: std_logic;

component mul is
  Port (a,b: in std_logic_vector(15 downto 0);
        mult: out std_logic_vector(15 downto 0) );
end component;

begin
i_mul: mul port map (a => a, b => b, mult => mult);
    A33(16) <= '0';
    A33(15 downto 0) <= A;
    B33(16) <= '0';
    B33(15 downto 0) <= B;
    
    process(A33, B33, ALUControl)
    begin
        case ALUControl(0) is
            when '0' => tmp <= A33 + B33;
            when '1' => tmp <= A33 - B33;
            when others => tmp <= (others => '0');
        end case;
    end process;
    Cout32 <= tmp(16);
    sum <= tmp(15 downto 0);
    
   process (A, B, ALUControl,mult,sum)
   begin
        case ALUControl is
            when "011" => resul <= A or B;
            when "010" => resul <= A and B;
            when "001" => resul <= sum;
            when "000" => resul <= sum;
            when "111" => resul <= mult;
            when "110"  => resul <= b;
            when others => resul <= (others => '0');
        end case;
   end process;
   
   process (resul)
   begin
        if(resul = 0) then 
            Z32 <= '1';
        else 
            Z32 <= '0';
        end if;
   end process;
   
   V1 <= not( (A(15) xor B(15)) xor ALUControl(0) );
   V2 <= sum(15) xor A(15);
   V3 <= not(ALUControl(1));
   
   C32 <= V3 and Cout32;
   V32 <= (V1 and V2) and V3;
   N32 <= resul(15);
   
  ALUFlags(0) <= V32;
  ALUFlags(1) <= C32;
  ALUFlags(2) <= Z32;
  ALUFlags(3) <= N32;
   
   Result <= resul;
end Behavioral;
   
