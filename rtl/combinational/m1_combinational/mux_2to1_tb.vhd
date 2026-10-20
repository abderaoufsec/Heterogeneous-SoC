LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_2to1_tb IS
END mux_2to1_tb;

ARCHITECTURE behavior OF mux_2to1_tb IS 
    COMPONENT mux_2to1
    PORT( In0, In1, Sel : IN  std_logic; Y : OUT  std_logic);
    END COMPONENT;
    signal In0, In1, Sel, Y : std_logic := '0';
BEGIN
    uut: mux_2to1 PORT MAP (In0 => In0, In1 => In1, Sel => Sel, Y => Y);
    stim_proc: process
    begin
        In0<='1'; In1<='0'; Sel<='0'; wait for 10 ns; -- Y should be 1
        In0<='1'; In1<='0'; Sel<='1'; wait for 10 ns; -- Y should be 0
        In0<='0'; In1<='1'; Sel<='0'; wait for 10 ns; -- Y should be 0
        In0<='0'; In1<='1'; Sel<='1'; wait for 10 ns; -- Y should be 1
        wait;
    end process;
END;
