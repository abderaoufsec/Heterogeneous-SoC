LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder_2to4_tb IS
END decoder_2to4_tb;

ARCHITECTURE behavior OF decoder_2to4_tb IS 
    COMPONENT decoder_2to4
    PORT( A : IN  std_logic_vector(1 downto 0); Y : OUT  std_logic_vector(3 downto 0));
    END COMPONENT;
    signal A : std_logic_vector(1 downto 0) := "00";
    signal Y : std_logic_vector(3 downto 0);
BEGIN
    uut: decoder_2to4 PORT MAP (A => A, Y => Y);
    stim_proc: process
    begin
        A<="00"; wait for 10 ns;
        A<="01"; wait for 10 ns;
        A<="10"; wait for 10 ns;
        A<="11"; wait for 10 ns;
        wait;
    end process;
END;
