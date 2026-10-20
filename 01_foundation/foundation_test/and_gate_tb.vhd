LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and_gate_tb IS
END and_gate_tb;

ARCHITECTURE behavior OF and_gate_tb IS 
    COMPONENT and_gate
    PORT( A : IN  std_logic;
          B : IN  std_logic;
          Y : OUT  std_logic);
    END COMPONENT;
    
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Y : std_logic;

BEGIN
   uut: and_gate PORT MAP (A => A, B => B, Y => Y);

   stim_proc: process
   begin
      -- Test all 4 combinations of A and B
      A <= '0'; B <= '0'; wait for 10 ns;
      A <= '0'; B <= '1'; wait for 10 ns;
      A <= '1'; B <= '0'; wait for 10 ns;
      A <= '1'; B <= '1'; wait for 10 ns;
      wait;
   end process;
END;
