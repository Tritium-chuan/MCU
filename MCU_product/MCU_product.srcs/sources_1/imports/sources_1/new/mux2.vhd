library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is  --2-input multiplexer
    generic(width: integer);
    port(d0, d1: in STD_LOGIC_VECTOR(width-1 downto 0);
         S:in STD_LOGIC;
         y:out STD_LOGIC_VECTOR(width-1 downto 0));
end mux2;

architecture Behavioral of mux2 is
begin
y <=d1 when s = '1' else d0;

end Behavioral;
