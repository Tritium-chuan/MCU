library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flopenr is  --flip-flop with enable and ynchronous reset
    generic(width: integer) ;
    port(clk,reset,en: in STD_LOGIC;
          d:in STD_LOGIC_VECTOR(width-1 downto 0);
          q:out STD_LOGIC_VECTOR(width-1 downto 0));
end flopenr;

architecture Behavioral of flopenr is
begin
process(clk,reset) begin
    if reset = '1' then q <= (others =>'0');
    elsif rising_edge(clk) then
        if en = '1' then q <= d;
        end if ;
    end if;
end process;
end Behavioral;
