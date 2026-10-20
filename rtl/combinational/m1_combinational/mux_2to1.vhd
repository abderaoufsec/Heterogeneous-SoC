library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1 is
    Port ( In0 : in  STD_LOGIC;
           In1 : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end mux_2to1;

architecture Behavioral of mux_2to1 is
begin
    Y <= In0 when Sel = '0' else In1;
end Behavioral;

