LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder3to8 IS
    PORT(w  : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
         En : IN  STD_LOGIC;
         y  : OUT STD_LOGIC_VECTOR(0 TO 7));
END decoder3to8;

ARCHITECTURE Behaviour OF decoder3to8 IS
    SIGNAL Enw : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    Enw <= En & w; 

    WITH Enw SELECT
y <= "00000001" WHEN "1000",  -- s0 = 5
     "00000010" WHEN "1001",  -- s1 = 0
     "00000100" WHEN "1010",  -- s2 = 1
     "00001000" WHEN "1011",  -- s3 = 3
     "00010000" WHEN "1100",  -- s4 = 1
     "00100000" WHEN "1101",  -- s5 = 4
     "01000000" WHEN "1110",  -- s6 = 6
     "10000000" WHEN "1111",  -- s7 = 7
     "00000000" WHEN OTHERS;

END Behaviour;
