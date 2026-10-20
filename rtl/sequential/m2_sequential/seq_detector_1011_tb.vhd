LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY seq_detector_1011_tb IS
END seq_detector_1011_tb;

ARCHITECTURE behavior OF seq_detector_1011_tb IS 
    COMPONENT seq_detector_1011
    PORT( CLK, RST, X : IN  std_logic; Y : OUT  std_logic);
    END COMPONENT;
    signal CLK, RST, X, Y : std_logic := '0';
    constant CLK_period : time := 10 ns;
BEGIN
    uut: seq_detector_1011 PORT MAP (CLK => CLK, RST => RST, X => X, Y => Y);

    clk_process :process
    begin
        CLK <= '0'; wait for CLK_period/2;
        CLK <= '1'; wait for CLK_period/2;
    end process;

    stim_proc: process
    begin
        RST <= '1'; wait for 15 ns; RST <= '0';
        
        -- Input sequence: 1 0 1 1 (Should trigger Y=1)
        X <= '1'; wait for 10 ns;
        X <= '0'; wait for 10 ns;
        X <= '1'; wait for 10 ns;
        X <= '1'; wait for 10 ns; -- Y should go high here
        
        -- Input sequence: 0 1 0 (Should NOT trigger)
        X <= '0'; wait for 10 ns;
        X <= '1'; wait for 10 ns;
        X <= '0'; wait for 10 ns;
        
        -- Input sequence: 1 0 1 1 (Trigger again)
        X <= '1'; wait for 10 ns;
        X <= '0'; wait for 10 ns;
        X <= '1'; wait for 10 ns;
        X <= '1'; wait for 10 ns; 
        wait;
    end process;
END;