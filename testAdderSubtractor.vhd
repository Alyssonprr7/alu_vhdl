LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY adderSubtractorTest IS 
END adderSubtractorTest;

ARCHITECTURE Behavior OF adderSubtractorTest IS 
	COMPONENT adderSubtractor 
		PORT (
			sub: IN STD_LOGIC; 
			a,b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			result: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			cout, overflow: OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL sub : STD_LOGIC;
	SIGNAL a,b, result: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL cout, overflow : STD_LOGIC;

BEGIN 
	uut: adderSubtractor PORT MAP (
		sub => sub,
		a => a,
		b => b,
		result => result,
		cout => cout,
		overflow => overflow
	);
	
	stim_proc: PROCESS 
	BEGIN
	WAIT FOR 50ns;
	
--	sub <= '0';
--	a <= "0001";
--	b <= "0010";
--	WAIT FOR 30ns;
--	
--	sub <= '0';
--	a <= "0011";
--	b <= "0001";
--	WAIT FOR 30ns;
--	
--	sub <= '1';
--	a <= "0011";
--	b <= "0001";
--	WAIT FOR 30ns;
	
	sub <= '0';
	a <= "1011";
	b <= "0001";
	WAIT FOR 30ns;
	
	sub <= '0';
	a <= "1011";
	b <= "1001";
	WAIT FOR 30ns;
	
	sub <= '1';
	a <= "1011";
	b <= "1100";
	WAIT FOR 30ns;
	
	sub <= '0';
	a <= "0111";
	b <= "0111";
	WAIT FOR 30ns;
	
	sub <= '1';
	a <= "0111";
	b <= "0111";
	WAIT FOR 30ns;
	
	sub <= '1';
	a <= "0010";
	b <= "0100";
	WAIT FOR 30ns;
	
	sub <= '1';
	a <= "0010";
	b <= "1100";
	WAIT FOR 30ns;
	
	sub <= '1';
	a <= "1000";
	b <= "1001";
	WAIT FOR 30ns;
	
	sub <= '0';
	a <= "1000";
	b <= "0101";
	WAIT FOR 30ns;
	
	END PROCESS;
END; 
	
	