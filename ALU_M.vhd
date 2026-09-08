library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU_M is
port( Clk : in std_logic; --input clock signal
      A :in unsigned(7 downto 0); --8-bit inputs from latches A and B
      B : in unsigned(7 downto 0); --8-bit student ID from FSM
		OP : in unsigned(0 to 15);
     student_id : in unsigned(3 downto 0); --6-bit selector for Operation from Decoder
	  result_out : out std_logic_vector(3 downto 0));
end ALU_M;

architecture calculation of ALU_M is --temporary signal declarations.
signal Reg1, Reg1_1, Reg2, Reg2_1:unsigned(3 downto 0);
signal student_num :unsigned(3 downto 0);
SIGNAL Result : std_logic_vector(3 downto 0);
--signal student_num : std_logic;
    

begin
Reg1 <= A(3 downto 0); --temporary store A in Reg1 local variable
Reg1_1 <= A(7 downto 4);
Reg2 <= B(3 downto 0); --temporary store B in Reg2 local variable
Reg2_1 <=B(7 downto 4);

student_num <= student_id;


process(Clk)
begin
	--if rising_edge(Clk) then
        case OP is
            WHEN "0000000000000001" =>
					IF (student_num(0)='1') THEN
					Result<="0000";
					ElSE 
						Result<="1111";
					END IF;

            WHEN "0000000000000010"=>
					IF (student_num(0)='1') THEN
					Result<="0000";
					ElSE 
						Result<="1111";
					END IF;
					
            WHEN "0000000000000100" => 
					IF (student_num(0)='1') THEN
					Result<="0000";
					ElSE 
						Result<="1111";
					END IF;
					
            WHEN "0000000000001000" =>
					IF (student_num(0)='1') THEN
					Result<="0000";
					ElSE 
						Result<="1111";
					END IF;
					
            WHEN "0000000000010000" =>
					IF (student_num(0)='1') THEN
					Result<="0000";
					ElSE 
						Result<="1111";
					END IF;
					
            WHEN "0000000000100000" =>
					IF (student_num(0)='1') THEN
					Result<="0000";
					ElSE 
						Result<="1111";
					END IF;
					
            WHEN "0000000001000000" =>
					IF (student_num(0)='1') THEN
					Result<="0000";
					ElSE 
						Result<="1111";
					END IF;
					
            WHEN "0000000010000000" =>
					IF (student_num(0)='1') THEN
					Result<="0000";
					ElSE 
						Result<="1111";
					END IF;
					
            WHEN "0000000100000000" => 
					IF (student_num(0)='1') THEN
					Result<="0000";
					ElSE 
						Result<="1111";
					END IF;
					
            WHEN OTHERS => 
					Result <= "0100";
        end case;
    --end if;
end process;
------
result_out<=Result;
end calculation;
