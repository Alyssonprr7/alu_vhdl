LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY counterTest IS 
END counterTest;

ARCHITECTURE Behavior OF counterTest IS 
	COMPONENT counter 
		PORT (
			clock, reset, load: IN STD_LOGIC;
			inputData: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			outputData: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL clk: STD_LOGIC:='0';
	SIGNAL rst: STD_LOGIC:='0';
	SIGNAL ld: STD_LOGIC:='0';
	SIGNAL output, input: STD_LOGIC_VECTOR(3 DOWNTO 0);
	CONSTANT clockPeriod: TIME := 10ns;
		  
BEGIN 	
	uut: counter PORT MAP (
		clk,
		rst,
		ld,
		input,
		output	
	);
	
	clockProcess: PROCESS 
	BEGIN 
		clk <= '0';
		WAIT FOR clockPeriod/2;
		clk <= '1';
		WAIT FOR clockPeriod/2;
	END PROCESS;
	
	
	
	
	stimProcess: PROCESS 
	BEGIN 
		ld <= '1';
		input <= "1001";
		WAIT FOR 10ns;
		ld <= '0';
		WAIT FOR 100ns;
	END PROCESS;
END Behavior; 