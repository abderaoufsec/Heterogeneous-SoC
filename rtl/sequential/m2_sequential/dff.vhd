library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           D   : in  STD_LOGIC;
           Q   : out STD_LOGIC);
end dff;

architecture Behavioral of dff is
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            Q <= '0'; -- Asynchronous reset
        elsif rising_edge(CLK) then
            Q <= D;
        end if;
    end process;
end Behavioral;