library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flopr is
    generic(width: integer);
    port(clk,reset:in STD_LOGIC;
         d:in STD_LOGIC_VECTOR(width-1 downto 0);
         q:out STD_LOGIC_VECTOR(width-1 downto 0));
end flopr;

architecture Behavioral of flopr is
begin
    process(clk,reset) begin
        if reset = '1' then q<=(others => '0');
        elsif rising_edge(clk) then q<=d;
        end if;
    end process;
end Behavioral;
