library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2to4 is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end decoder_2to4;

architecture Behavioral of decoder_2to4 is
begin
    with A select
        Y <= "0001" when "00",
             "0010" when "01",
             "0100" when "10",
             "1000" when others; -- "11"
end Behavioral;