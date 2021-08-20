LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY binaryTo7SegHex IS
	PORT (
		binary: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		in7Seg: OUT STD_LOGIC_VECTOR (6 DOWNTO 0) -- O nome nao poderia ser iniciado com numeral
	);
END binaryTo7SegHex;

ARCHITECTURE Behavioral OF binaryTo7SegHex IS 

BEGIN

PROCESS (binary)
BEGIN 
	IF binary = "0000" THEN in7Seg <= "1000000";
		ELSIF binary = "0001" THEN in7Seg <= "1111001";
		ELSIF binary = "0010" THEN in7Seg <= "0100100";
		ELSIF binary = "0011" THEN in7Seg <= "0110000";
		ELSIF binary = "0100" THEN in7Seg <= "0011001";
		ELSIF binary = "0101" THEN in7Seg <= "0010010";
		ELSIF binary = "0110" THEN in7Seg <= "0000010";
		ELSIF binary = "0111" THEN in7Seg <= "1111000";
		ELSIF binary = "1000" THEN in7Seg <= "0000000";
		ELSIF binary = "1001" THEN in7Seg <= "0011000";
		ELSIF binary = "1010" THEN in7Seg <= "0001000";
		ELSIF binary = "1011" THEN in7Seg <= "0000011";
		ELSIF binary = "1100" THEN in7Seg <= "1000110";
		ELSIF binary = "1101" THEN in7Seg <= "0100001";
		ELSIF binary = "1110" THEN in7Seg <= "0000110";
		ELSIF binary = "1111" THEN in7Seg <= "0001110";
		ELSE in7Seg <= "1111111";
	END IF;
END PROCESS; 
END Behavioral; 
	
		