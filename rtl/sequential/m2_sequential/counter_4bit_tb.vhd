LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY counter_4bit_tb IS
END counter_4bit_tb;

ARCHITECTURE behavior OF counter_4bit_tb IS 
    COMPONENT counter_4bit
    PORT( CLK, RST, EN : IN  std_logic; Q : OUT  std_logic_vector(3 downto 0));
    END COMPONENT;
    signal CLK, RST, EN : std_logic := '0';
    signal Q : std_logic_vector(3 downto 0);
    constant CLK_period : time := 10 ns;
BEGIN
    uut: counter_4bit PORT MAP (CLK => CLK, RST => RST, EN => EN, Q => Q);

    clk_process :process
    begin
        CLK <= '0'; wait for CLK_period/2;
        CLK <= '1'; wait for CLK_period/2;
    end process;

    stim_proc: process
    begin
        RST <= '1'; wait for 15 ns; RST <= '0';
        EN <= '1'; wait for 180 ns; -- Let it count up to 15 and roll over
        EN <= '0'; wait for 20 ns;  -- Pause the count
        wait;
    end process;
END;
