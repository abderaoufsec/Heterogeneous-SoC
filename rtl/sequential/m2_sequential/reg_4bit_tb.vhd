LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_4bit_tb IS
END reg_4bit_tb;

ARCHITECTURE behavior OF reg_4bit_tb IS 
    COMPONENT reg_4bit
    PORT( CLK, RST, EN : IN  std_logic; D : IN  std_logic_vector(3 downto 0); Q : OUT  std_logic_vector(3 downto 0));
    END COMPONENT;
    signal CLK, RST, EN : std_logic := '0';
    signal D, Q : std_logic_vector(3 downto 0) := "0000";
    constant CLK_period : time := 10 ns;
BEGIN
    uut: reg_4bit PORT MAP (CLK => CLK, RST => RST, EN => EN, D => D, Q => Q);

    clk_process :process
    begin
        CLK <= '0'; wait for CLK_period/2;
        CLK <= '1'; wait for CLK_period/2;
    end process;

    stim_proc: process
    begin
        RST <= '1'; wait for 15 ns; RST <= '0';
        D <= "1010"; EN <= '0'; wait for 20 ns; -- Should NOT change because EN=0
        EN <= '1'; wait for 20 ns;              -- Should change to 1010 on clock edge
        D <= "0101"; EN <= '0'; wait for 20 ns; -- Should stay 1010
        wait;
    end process;
END;