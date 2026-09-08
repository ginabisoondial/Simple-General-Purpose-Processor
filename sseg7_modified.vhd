LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY sseg7_modified IS
	PORT (
	bcd : IN std_logic_vector(3 DOWNTO 0) ;
	leds: OUT STD_LOGIC_VECTOR(0 TO 6));
END sseg7_modified ;

ARCHITECTURE Behavior OF sseg7_modified IS
BEGIN
	PROCESS (bcd)
	BEGIN
		CASE bcd IS --               abcdefg
				WHEN "0000" => leds <="1000100"; --y
				WHEN OTHERS => leds <= "0001001"; --n
		END CASE;
	END PROCESS;
END Behavior;
			