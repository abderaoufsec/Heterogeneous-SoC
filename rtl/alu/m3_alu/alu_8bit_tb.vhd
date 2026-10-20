LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY alu_8bit_tb IS
END alu_8bit_tb;
 
ARCHITECTURE behavior OF alu_8bit_tb IS 
    COMPONENT alu_8bit
    PORT( A, B : IN  std_logic_vector(7 downto 0);
          ALU_Sel : IN  std_logic_vector(2 downto 0);
          Result : OUT  std_logic_vector(7 downto 0);
          Zero, Carry, Overflow : OUT  std_logic);
    END COMPONENT;
    
   signal A, B : std_logic_vector(7 downto 0) := (others => '0');
   signal ALU_Sel : std_logic_vector(2 downto 0) := (others => '0');
   signal Result : std_logic_vector(7 downto 0);
   signal Zero, Carry, Overflow : std_logic;
 
BEGIN
   uut: alu_8bit PORT MAP (A => A, B => B, ALU_Sel => ALU_Sel, 
                           Result => Result, Zero => Zero, Carry => Carry, Overflow => Overflow);

   stim_proc: process
   begin		
      -- 1. Test ADD (Normal)
      A <= "00000101"; B <= "00000011"; ALU_Sel <= "000"; wait for 10 ns; -- 5 + 3 = 8

      -- 2. Test ADD (Carry out)
      A <= "11111111"; B <= "00000001"; ALU_Sel <= "000"; wait for 10 ns; -- 255 + 1 = 256 (Carry=1)

      -- 3. Test ADD (Signed Overflow: 127 + 1 = -128)
      A <= "01111111"; B <= "00000001"; ALU_Sel <= "000"; wait for 10 ns; 

      -- 4. Test SUB (Zero flag)
      A <= "00001010"; B <= "00001010"; ALU_Sel <= "001"; wait for 10 ns; -- 10 - 10 = 0 (Zero=1)

      -- 5. Test AND
      A <= "11110000"; B <= "10101010"; ALU_Sel <= "010"; wait for 10 ns; -- Result = 10100000

      -- 6. Test OR
      A <= "11110000"; B <= "00001111"; ALU_Sel <= "011"; wait for 10 ns; -- Result = 11111111

      -- 7. Test XOR
      A <= "11110000"; B <= "11110000"; ALU_Sel <= "100"; wait for 10 ns; -- Result = 00000000 (Zero=1)

      -- 8. Test Shift Left (Carry out)
      A <= "10000001"; B <= "00000000"; ALU_Sel <= "101"; wait for 10 ns; -- Result = 00000010 (Carry=1)

      -- 9. Test Shift Right (Carry out)
      A <= "00000011"; B <= "00000000"; ALU_Sel <= "110"; wait for 10 ns; -- Result = 00000001 (Carry=1)

      -- 10. Test NOT A
      A <= "00001111"; B <= "00000000"; ALU_Sel <= "111"; wait for 10 ns; -- Result = 11110000

      wait;
   end process;
END;
