LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY interface IS 
	PORT (
		a,b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		selector: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		cout, overflow, zero, negative: OUT STD_LOGIC;
		a7Seg, b7Seg, result7Seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)		
	);
END interface;

ARCHITECTURE struct OF interface IS

COMPONENT alu IS 
	PORT (
		a,b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		selector: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		cout, overflow: OUT STD_LOGIC;
		result: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END COMPONENT;
 
COMPONENT binaryTo7SegHex IS 
	PORT (
		binary: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		in7Seg: OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END COMPONENT;

SIGNAL result: STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
aluOperation: alu PORT MAP (	a => a,
										b => b,
										selector => selector,
										cout => cout,
										overflow => overflow,
										result => result
									);

PROCESS(result)	
BEGIN
		IF (result = "0000") THEN
			zero <= '1';
		ELSE zero <= '0';
		END IF;
END PROCESS;

first7Seg: binaryTo7SegHex PORT MAP (a, a7Seg); 
second7Seg: binaryTo7SegHex PORT MAP (b, b7Seg);
sum7Seg: binaryTo7SegHex PORT MAP (result, result7Seg);

negative <= result(3);			
END struct;



