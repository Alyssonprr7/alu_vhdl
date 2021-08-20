LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY interfaceWithCounter IS 
	PORT (
		b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		selector: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		clock, load, reset: IN STD_LOGIC;
		cout, overflow, zero, negative: OUT STD_LOGIC;
		a7Seg, b7Seg, result7Seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)		
	);
END interfaceWithCounter;

ARCHITECTURE struct OF interfaceWithCounter IS

COMPONENT interface IS 
	PORT (
		a,b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		selector: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		cout, overflow, zero, negative: OUT STD_LOGIC;
		a7Seg, b7Seg, result7Seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)		
	);
END COMPONENT;
 
--COMPONENT counter IS 
--	PORT (
--		clock, reset, load: IN STD_LOGIC;
--		inputData: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--		outputData: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
--	);
--END COMPONENT;

COMPONENT counter IS 
	PORT (
		clock, reset: IN STD_LOGIC;
		outputData: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL a: STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";

BEGIN
--counterOperation: counter PORT MAP ( clock => clock,
--												 reset => reset,
--												 load => load,
--												 inputData=>"0000",
--												 outputData => a
--												);


counterOperation: counter PORT MAP ( clock => clock,
												 reset => reset,
												 outputData => a
												);


interfaceOperation: interface PORT MAP (a => a,
										b => b,
										selector => selector,
										cout => cout,
										overflow => overflow,
										zero => zero,
										negative => negative,
										a7Seg => a7Seg,
										b7Seg => b7Seg,
										result7Seg=>result7Seg
									);
END struct;

