library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1 is
    Port ( In0, In1, In2, In3 : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out  STD_LOGIC);
end mux_4to1;

architecture Behavioral of mux_4to1 is
begin
    with Sel select
        Y <= In0 when "00",
             In1 when "01",
             In2 when "10",
             In3 when others; -- "11"
end Behavioral;

