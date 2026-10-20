LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY half_adder_tb IS
END half_adder_tb;

ARCHITECTURE behavior OF half_adder_tb IS 
    COMPONENT half_adder
    PORT( A : IN  std_logic; B : IN  std_logic; S : OUT  std_logic; C : OUT  std_logic);
    END COMPONENT;
    signal A, B, S, C : std_logic := '0';
BEGIN
    uut: half_adder PORT MAP (A => A, B => B, S => S, C => C);
    stim_proc: process
    begin
        A<='0'; B<='0'; wait for 10 ns;
        A<='0'; B<='1'; wait for 10 ns;
        A<='1'; B<='0'; wait for 10 ns;
        A<='1'; B<='1'; wait for 10 ns;
        wait;
    end process;
END;