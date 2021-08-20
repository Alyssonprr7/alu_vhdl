LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY alu IS 
	PORT (
		a,b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		selector: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		cout, overflow: OUT STD_LOGIC;
		result: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END alu; 

ARCHITECTURE struct OF alu IS 
COMPONENT adderSubtractor IS 
	PORT (
		sub: IN STD_LOGIC; 
		a,b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		result: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		cout, overflow: OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL resultAdd, resultSub, resultIncrement, resultDecrement, bAux: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL coutAdd, coutSub, coutIncrement, coutDecrement, overflowAdd, overflowSub, overflowIncrement, overflowDecrement: STD_LOGIC;

BEGIN	
	adder: adderSubtractor PORT MAP ('0', a, b, resultAdd, coutAdd, overflowAdd);
	subtractor: adderSubtractor PORT MAP ('1', a, b, resultSub, coutSub, overflowSub);
	increment: adderSubtractor PORT MAP ('0', a, "0001", resultIncrement, coutIncrement, overflowIncrement);
	decrement: adderSubtractor PORT MAP ('1', a, "0001", resultDecrement, coutDecrement, overflowDecrement);

	
	WITH selector SELECT 
		result <= resultAdd WHEN "000",
					 resultSub WHEN "001",
					 resultIncrement WHEN "010",
					 resultDecrement WHEN "011",
					 a AND b WHEN "100",
					 a OR b WHEN "101",
					 a XOR b WHEN "110",
					 NOT a WHEN "111",
					 "0000" WHEN OTHERS;
					 
	 WITH selector SELECT 
		cout <= coutAdd WHEN "000",
				  coutSub WHEN "001",
				  coutIncrement WHEN "010",
				  coutDecrement WHEN "011",
				  '0' WHEN OTHERS;
				  
	  WITH selector SELECT 
		overflow <= overflowAdd WHEN "000",
				  overflowSub WHEN "001",
				  overflowIncrement WHEN "010",
				  overflowDecrement WHEN "011",
				  '0' WHEN OTHERS;
--
----Inicialmente eu tentei fazer um NOR de 4 entradas, usando os bits de result para ter o zero
----Mas por estar dando erro, optei por essa forma
--PROCESS(result)	
--BEGIN
--		IF (result = "0000") THEN
--			zero <= '1';
--		ELSE zero <= '0';
--		END IF;
--END PROCESS;

--	negative <= result(3);
--	result <= resultAux;
--	first7Seg: binaryTo7SegHex PORT MAP (a, a7Seg); 
--	second7Seg: binaryTo7SegHex PORT MAP (b, b7Seg);
--	sum7Seg: binaryTo7SegHex PORT MAP (result, result7Seg);


-- PASSAR O NEGATIVE, O ZERO E OS 7SEG PARA FORA

END struct;
		
	


