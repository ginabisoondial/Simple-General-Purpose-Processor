library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU is
port( Clk : in std_logic; --input clock signal
      A :in unsigned(7 downto 0); --8-bit inputs from latches A and B
      B : in unsigned(7 downto 0); --8-bit student ID from FSM
      OP : in unsigned(0 to 15); --6-bit selector for Operation from Decoder
      Neg: out std_logic; --is the result negative? Set=for 8-bit output
      R1 : out unsigned(3 downto 0); -- lower 4-bits of 8-bit Result Output
      R2 : out unsigned(3 downto 0)); -- higher 4-bits of 8-bit Result Output
end ALU;
architecture calculation of ALU is --temporary signal declarations.
signal Reg1,Reg2, Result:unsigned(7 downto 0) := (others => '0');
    


begin
Reg1 <= A; --temporary store A in Reg1 local variable
Reg2 <= B; --temporary store B in Reg2 local variable


process(Clk)
begin
        case OP is
            WHEN "0000000000000001" =>
					Neg <= '0';
					Result <= Reg1 + Reg2;
                -- Do Addition for Reg1 and Reg2
					 
            WHEN "0000000000000010"=>
					IF (Reg1 >= Reg2) THEN
						Neg <= '0';
						Result <= Reg1 - Reg2;
					ELSE
						Neg <= '1';
						Result <= Reg2 - Reg1;
					END IF;
                --Do Subtraction
                --Do shift of test if required.
					 
            WHEN "0000000000000100" => 
					Neg <= '0';
					Result <= NOT Reg1;
                -- Do Inverse
					 
            WHEN "0000000000001000" =>
					Neg <= '0';
					Result <= Reg1 NAND Reg2;
                --Do Boolean NAND (PROBLEM 1)
					 
					 --Result<=NOT Reg2 +"00000001"; (PROBLEM 2)
					 
            WHEN "0000000000010000" =>
					Neg <= '0';
					Result <= Reg1 NOR Reg2;
                --Do Boolean NOR (PROBLEM 1)
					 
					 --Result <= Reg2 - "00000101"; (PROBLEM 2)
					 
            WHEN "0000000000100000" =>
					Neg <= '0';
					Result <= Reg1 AND Reg2;
                --Do Boolean AND
					 
            WHEN "0000000001000000" =>
					Neg <= '0';
					Result <= Reg1 XOR Reg2;
                --Do Boolean XOR
					 
            WHEN "0000000010000000" =>
					Neg <= '0';
					Result <= Reg1 OR Reg2;
                --Do Boolean OR
					 
            WHEN "0000000100000000" => 
					Neg <= '0';
					Result <= Reg1 XNOR Reg2;
                --Do Boolean XNOR
					 
            WHEN OTHERS => 
					Result <= Result;
        end case;
end process;
R1 <= Result(3 downto 0); --Since the output seven segments can
R2 <= Result(7 downto 4); -- only 4-bits, split the 8-bit to two 4-bits.
end calculation;
