LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_4to1_tb IS
END mux_4to1_tb;

ARCHITECTURE behavior OF mux_4to1_tb IS 
    COMPONENT mux_4to1
    PORT( In0, In1, In2, In3 : IN  std_logic; Sel : IN  std_logic_vector(1 downto 0); Y : OUT  std_logic);
    END COMPONENT;
    signal In0, In1, In2, In3, Y : std_logic := '0';
    signal Sel : std_logic_vector(1 downto 0) := "00";
BEGIN
    uut: mux_4to1 PORT MAP (In0 => In0, In1 => In1, In2 => In2, In3 => In3, Sel => Sel, Y => Y);
    stim_proc: process
    begin
        In0<='1'; In1<='0'; In2<='0'; In3<='0'; Sel<="00"; wait for 10 ns; -- Y=1
        Sel<="01"; wait for 10 ns; -- Y=0
        In1<='1'; Sel<="01"; wait for 10 ns; -- Y=1
        Sel<="10"; wait for 10 ns; -- Y=0
        In2<='1'; Sel<="10"; wait for 10 ns; -- Y=1
        Sel<="11"; wait for 10 ns; -- Y=0
        In3<='1'; Sel<="11"; wait for 10 ns; -- Y=1
        wait;
    end process;
END;
