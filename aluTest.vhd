LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY aluTest IS 
END aluTest;

ARCHITECTURE Behavior OF aluTest IS 
	COMPONENT alu 
		PORT (
			a,b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			selector: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			cout, overflow, negative, zero: OUT STD_LOGIC;
			result: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL a,b, result: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL selector : STD_LOGIC_VECTOR(2 DOWNTO 0);
	SIGNAL cout, overflow: STD_LOGIC;


BEGIN 
	uut: alu PORT MAP (
		a => a,
		b => b,
		selector => selector,
		cout => cout,
		overflow => overflow,
		result => result
	);
	
	stim_proc: PROCESS 
	BEGIN
	WAIT FOR 50ns;
	
	selector <= "000";
	a <= "0001";
	b <= "0100";
	WAIT FOR 30ns;
	
	selector <= "001";
	a <= "0001";
	b <= "0100";
	WAIT FOR 30ns;
	
	selector <= "000";
	a <= "0001";
	b <= "0100";
	WAIT FOR 30ns;
	
	selector <= "010";
	a <= "0001";
	b <= "0100";
	WAIT FOR 30ns;
	
	selector <= "011";
	a <= "0001";
	b <= "0100";
	WAIT FOR 30ns;
	
	selector <= "100";
	a <= "0001";
	b <= "0100";
	WAIT FOR 30ns;
	
	selector <= "101";
	a <= "0001";
	b <= "0100";
	WAIT FOR 30ns;
	
	selector <= "110";
	a <= "0001";
	b <= "0100";
	WAIT FOR 30ns;
	
	selector <= "111";
	a <= "0001";
	b <= "0100";
	WAIT FOR 30ns;
	
	END PROCESS;
END; 