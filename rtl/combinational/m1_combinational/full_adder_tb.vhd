LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_tb IS
END full_adder_tb;

ARCHITECTURE behavior OF full_adder_tb IS 
    COMPONENT full_adder
    PORT( A, B, Cin : IN  std_logic; S, Cout : OUT  std_logic);
    END COMPONENT;
    signal A, B, Cin, S, Cout : std_logic := '0';
BEGIN
    uut: full_adder PORT MAP (A => A, B => B, Cin => Cin, S => S, Cout => Cout);
    stim_proc: process
    begin
        A<='0'; B<='0'; Cin<='0'; wait for 10 ns;
        A<='0'; B<='0'; Cin<='1'; wait for 10 ns;
        A<='0'; B<='1'; Cin<='0'; wait for 10 ns;
        A<='0'; B<='1'; Cin<='1'; wait for 10 ns;
        A<='1'; B<='0'; Cin<='0'; wait for 10 ns;
        A<='1'; B<='0'; Cin<='1'; wait for 10 ns;
        A<='1'; B<='1'; Cin<='0'; wait for 10 ns;
        A<='1'; B<='1'; Cin<='1'; wait for 10 ns;
        wait;
    end process;
END;
