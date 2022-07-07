library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mul is
  Port (a,b: in std_logic_vector(15 downto 0);
        mult: out std_logic_vector(15 downto 0));
end mul;

architecture Behavioral of mul is
signal sig : std_logic := '0';
signal aa, bb ,mull: std_logic_vector(15 downto 0);
signal mult32 : std_logic_vector(31 downto 0);
signal mult_a1b2,mult_a2b1 : std_logic_vector(15 downto 0);

begin
    aa <= (0 - a) when a(15) = '1' else a; 
    bb <= (0 - b) when b(15) = '1' else b; 
    sig <= a(15) xor b(15);
    mult_a1b2 <= aa(15 downto 8) * bb(7 downto 0);
    mult_a2b1 <= bb(15 downto 8) * aa(7 downto 0);
    mult32 <= mult_a1b2&"00000000"+mult_a2b1&"00000000"+aa(7 downto 0)*bb(7 downto 0);
    mull <= mult32(15 downto 0);
    mult <= (0 - mull) when sig = '1' else mull;
end Behavioral;