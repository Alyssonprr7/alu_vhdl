LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY interfaceWithCounterTest IS 
END interfaceWithCounterTest;


ARCHITECTURE Behavior OF interfaceWithCounterTest IS 
	
COMPONENT interfaceWithCounter 
	PORT (
		b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		selector: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		clock, load, reset: IN STD_LOGIC;
		cout, overflow, zero, negative: OUT STD_LOGIC;
		a7Seg, b7Seg, result7Seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)	
	);
END COMPONENT;
	
SIGNAL b: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL selector : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL cout, overflow, zero, negative: STD_LOGIC;
SIGNAL a7Seg, b7Seg, result7Seg : STD_LOGIC_VECTOR(6 DOWNTO 0);		
CONSTANT clockPeriod: TIME := 90ns;

SIGNAL clk: STD_LOGIC:='0';
SIGNAL rst: STD_LOGIC:='0';
SIGNAL ld: STD_LOGIC:='0';
		  
BEGIN 
	uut: interfaceWithCounter PORT MAP (
		b => b,
		selector => selector,
		clock => clk,
		load => ld,
		cout => cout,
		reset => rst,
		overflow => overflow,
		zero => zero,
		negative => negative,
		a7Seg => a7seg,
		b7Seg => b7Seg,
		result7Seg => result7Seg
	);
	
	clockProcess: PROCESS 
	BEGIN 
		clk <= '0';
		WAIT FOR clockPeriod/2;
		clk <= '1';
		WAIT FOR clockPeriod/2;
	END PROCESS;
	
	stim_proc: PROCESS 
	BEGIN
	
	b <= "1001";
	selector <= "000";
	WAIT FOR 10ns;
	
	selector <= "001";
	WAIT FOR 10ns;
	
	selector <= "000";
	WAIT FOR 10ns;
	
	selector <= "010";
	WAIT FOR 10ns;
	
	selector <= "011";
	WAIT FOR 10ns;
	
	selector <= "100";
	WAIT FOR 10ns;
	
	selector <= "101";
	WAIT FOR 10ns;
	
	selector <= "110";
	WAIT FOR 10ns;
	
	selector <= "111";
	WAIT FOR 10ns;
	
	END PROCESS;
END Behavior; 