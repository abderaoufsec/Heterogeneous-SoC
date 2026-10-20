library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_4bit is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN  : in  STD_LOGIC;
           Q   : out STD_LOGIC_VECTOR (3 downto 0));
end counter_4bit;

architecture Behavioral of counter_4bit is
    signal count : unsigned(3 downto 0) := (others => '0');
begin
    process(CLK, RST)
    begin
        if RST = '1' then
            count <= (others => '0');
        elsif rising_edge(CLK) then
            if EN = '1' then
                count <= count + 1; -- It will automatically roll over from 15 to 0
            end if;
        end if;
    end process;
    Q <= std_logic_vector(count);
end Behavioral;

