LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY board IS 
	PORT (
		CLOCK_50: IN STD_LOGIC; -- CLOCK
--		V_BT: IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- SELETOR 
		SW: IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- SELECTOR
		V_SW: IN STD_LOGIC_VECTOR(17 DOWNTO 14); -- B
		G_HEX7: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- Display Result
		G_HEX6: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- Display A
		G_HEX5: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- Display B
		G_LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)	-- ZERO, OVERFLOW, COUT, NEGATIVE	
	);
END board;
ARCHITECTURE struct OF board IS 
	COMPONENT interfaceWithCounter PORT (
		b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		selector: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		clock, load, reset: IN STD_LOGIC;
		cout, overflow, zero, negative: OUT STD_LOGIC;
		a7Seg, b7Seg, result7Seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)			
	);
	END COMPONENT;

BEGIN 
	conection: interfaceWithCounter PORT MAP (
			b => V_SW,
--			selector => NOT V_BT,
			selector => SW,
			clock => CLOCK_50, 
			load => '0', -- TODO tirar
			reset => '0',
			cout => G_LEDR(3),
			overflow => G_LEDR(2),
			zero => G_LEDR(1),
			negative => G_LEDR(0),
			a7Seg => G_HEX7,
			b7Seg => G_HEX6,
			result7Seg => G_HEX5
	);



END struct;