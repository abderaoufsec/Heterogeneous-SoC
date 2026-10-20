library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_8bit is
    Port ( A        : in  STD_LOGIC_VECTOR (7 downto 0);
           B        : in  STD_LOGIC_VECTOR (7 downto 0);
           ALU_Sel  : in  STD_LOGIC_VECTOR (2 downto 0); -- 3 bits = 8 operations
           Result   : out STD_LOGIC_VECTOR (7 downto 0);
           Zero     : out STD_LOGIC;
           Carry    : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end alu_8bit;


architecture Behavioral of alu_8bit is
    -- We need a 9-bit temporary signal to capture the carry-out
    signal temp_result : std_logic_vector(8 downto 0);
    signal signed_result : signed(7 downto 0);
begin

    process(A, B, ALU_Sel)
        -- Variables for arithmetic operations
        variable var_a_uns, var_b_uns : unsigned(7 downto 0);
        variable var_a_sgn, var_b_sgn : signed(7 downto 0);
        variable res_uns : unsigned(8 downto 0);
        variable res_sgn : signed(8 downto 0);
    begin
        -- Default assignments to prevent latches
        temp_result <= (others => '0');
        Carry <= '0';
        Overflow <= '0';
        signed_result <= (others => '0');

        -- Cast inputs to numeric types
        var_a_uns := unsigned(A);
        var_b_uns := unsigned(B);
        var_a_sgn := signed(A);
        var_b_sgn := signed(B);

        case ALU_Sel is
            when "000" => -- ADD (Unsigned arithmetic for Carry)
                res_uns := ('0' & var_a_uns) + ('0' & var_b_uns);
                temp_result <= std_logic_vector(res_uns);
                Carry <= res_uns(8);
                
                -- Overflow detection (Signed addition)
                res_sgn := ('0' & var_a_sgn) + ('0' & var_b_sgn);
                if (var_a_sgn(7) = var_b_sgn(7)) and (res_sgn(7) /= var_a_sgn(7)) then
                    Overflow <= '1';
                end if;

            when "001" => -- SUB
                res_uns := ('0' & var_a_uns) - ('0' & var_b_uns);
                temp_result <= std_logic_vector(res_uns);
                
                -- Overflow detection (Signed subtraction)
                res_sgn := ('0' & var_a_sgn) - ('0' & var_b_sgn);
                if (var_a_sgn(7) /= var_b_sgn(7)) and (res_sgn(7) /= var_a_sgn(7)) then
                    Overflow <= '1';
                end if;

            when "010" => -- AND
                temp_result(7 downto 0) <= A and B;
                
            when "011" => -- OR
                temp_result(7 downto 0) <= A or B;
                
            when "100" => -- XOR
                temp_result(7 downto 0) <= A xor B;
                
            when "101" => -- Shift Left (Logical)
                temp_result <= A & '0';
                Carry <= A(7); -- MSB is shifted out
                
            when "110" => -- Shift Right (Logical)
                temp_result(7 downto 0) <= '0' & A(7 downto 1);
                Carry <= A(0); -- LSB is shifted out
                
            when "111" => -- NOT A
                temp_result(7 downto 0) <= not A;
                
            when others =>
                temp_result <= (others => '0');
        end case;
    end process;

    -- Final Outputs
    Result <= temp_result(7 downto 0);
    
    -- Zero flag goes high when the result is exactly 00000000
    Zero <= '1' when temp_result(7 downto 0) = "00000000" else '0';

end Behavioral;