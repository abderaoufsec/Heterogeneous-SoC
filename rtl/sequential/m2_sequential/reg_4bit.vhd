library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_4bit is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN  : in  STD_LOGIC;
           D   : in  STD_LOGIC_VECTOR (3 downto 0);
           Q   : out STD_LOGIC_VECTOR (3 downto 0));
end reg_4bit;

architecture Behavioral of reg_4bit is
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            Q <= (others => '0');
        elsif rising_edge(CLK) then
            if EN = '1' then
                Q <= D; -- Only update if Enable is high
            end if;
        end if;
    end process;
end Behavioral;

