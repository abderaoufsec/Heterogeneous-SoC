library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seq_detector_1011 is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           X   : in  STD_LOGIC;
           Y   : out STD_LOGIC);
end seq_detector_1011;

architecture Behavioral of seq_detector_1011 is
    type state_type is (S0, S1, S2, S3, S4);
    signal current_state, next_state : state_type;
begin

    -- 1. State Register (Sequential)
    process(CLK, RST)
    begin
        if RST = '1' then
            current_state <= S0;
        elsif rising_edge(CLK) then
            current_state <= next_state;
        end if;
    end process;

    -- 2. Next State Logic (Combinational)
    process(current_state, X)
    begin
        case current_state is
            when S0 => 
                if X = '1' then next_state <= S1; else next_state <= S0; end if;
            when S1 => 
                if X = '0' then next_state <= S2; else next_state <= S1; end if;
            when S2 => 
                if X = '1' then next_state <= S3; else next_state <= S0; end if;
            when S3 => 
                if X = '1' then next_state <= S4; else next_state <= S2; end if;
            when S4 => 
                if X = '1' then next_state <= S1; else next_state <= S0; end if;
            when others => next_state <= S0;
        end case;
    end process;

    -- 3. Output Logic (Combinational - Moore Machine)
    Y <= '1' when current_state = S4 else '0';

end Behavioral;