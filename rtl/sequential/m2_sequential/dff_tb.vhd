LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY dff_tb IS
END dff_tb;

ARCHITECTURE behavior OF dff_tb IS 
    COMPONENT dff
    PORT( CLK, RST, D : IN  std_logic; Q : OUT  std_logic);
    END COMPONENT;
    signal CLK, RST, D, Q : std_logic := '0';
    constant CLK_period : time := 10 ns;
BEGIN
    uut: dff PORT MAP (CLK => CLK, RST => RST, D => D, Q => Q);

    clk_process :process
    begin
        CLK <= '0'; wait for CLK_period/2;
        CLK <= '1'; wait for CLK_period/2;
    end process;

    stim_proc: process
    begin
        RST <= '1'; wait for 15 ns; -- Test Reset
        RST <= '0'; 
        D <= '1'; wait for 10 ns;   -- D goes high, wait for next clock
        D <= '0'; wait for 20 ns;   -- D goes low
        D <= '1'; wait for 10 ns;
        wait;
    end process;
END;