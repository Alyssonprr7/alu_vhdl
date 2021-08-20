-- Full Adder de 1 bit
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fullAdder IS 
	PORT (
		x,y,cin: IN STD_LOGIC;
		sum, cout: OUT STD_LOGIC
	);
END fullAdder;

ARCHITECTURE behavior OF fullAdder IS 
BEGIN 
	sum <= (x XOR y) XOR cin;
	cout <= ((x XOR y) AND cin) OR (x AND y);
--	cout <= (x AND (y OR cin)) OR (cin AND y);
END behavior;


-- ====================================================

-- Somador/Subtrator 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY adderSubtractor IS 
	PORT (
		sub: IN STD_LOGIC; 
		a,b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		result: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		cout, overflow: OUT STD_LOGIC
	);
END adderSubtractor;

ARCHITECTURE struct OF adderSubtractor IS 
COMPONENT fullAdder IS
	PORT ( 
		x,y, cin : IN STD_LOGIC;
		sum,cout: OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL carry0, carry1, carry2, carry3: STD_LOGIC;
SIGNAL subXorB: STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN 
subxorB(0) <= sub XOR b(0); 
subxorB(1) <= sub XOR b(1); 
subxorB(2) <= sub XOR b(2);
subxorB(3) <= sub XOR b(3);

fullAdder0: fullAdder PORT MAP (a(0), subXorB(0), sub, result(0), carry0);
fullAdder1: fullAdder PORT MAP (a(1), subXorB(1), carry0, result(1), carry1);  
fullAdder2: fullAdder PORT MAP (a(2), subXorB(2), carry1, result(2), carry2);  
fullAdder3: fullAdder PORT MAP (a(3), subXorB(3), carry2, result(3), carry3);  
overflow <= carry2 XOR carry3; 
cout <= carry3;

END struct;
  