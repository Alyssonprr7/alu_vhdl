--LIBRARY IEEE;
--USE IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--ENTITY counter IS 
--	PORT (
--		clock, reset, load: IN STD_LOGIC;
--		inputData: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--		outputData: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
--	);
--END  counter;
--
--ARCHITECTURE struct OF counter IS 
--BEGIN 
--	PROCESS(clock, reset)
--	variable outputAux: STD_LOGIC_VECTOR(3 DOWNTO 0);
--	BEGIN 
--		IF (reset = '1') THEN 
--			outputAux := "0000";
--		ELSIF (clock'EVENT AND clock = '1') THEN 
--			IF (outputAux < "1111") THEN
--				IF (load = '1' ) THEN 
--					outputAux := inputData;
--				ELSE 
--					outputAux := outputAux+1;
--				END IF;
--			ELSE 
--				outputAux := "0000";
--			END IF;
--		END IF;
--		
--	outputData <= outputAux;
--	END PROCESS;
--	
--END struct;



LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY counter IS 
	PORT (
		clock, reset: IN STD_LOGIC;
		outputData: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END  counter;

ARCHITECTURE struct OF counter IS 
SIGNAL insideCounter: INTEGER RANGE 0 TO 99999998:=0;	

BEGIN 
	PROCESS(clock, reset)
	VARIABLE outputAux: STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";

	
	BEGIN 
		IF (reset = '1') THEN
			insideCounter <= 0;
			outputAux := "0000";
		ELSIF (clock'EVENT AND clock = '1') THEN 
			IF (insideCounter = 99999998) THEN
				insideCounter <= 0;
				IF (outputAux < "1111") THEN
					outputAux := outputAux+"0001";
				ELSE 
					outputAux := "0000";			
				END IF;
			ELSE 
				insideCounter <= insideCounter +1;
			END IF;
		END IF;
		
	outputData <= outputAux;
	END PROCESS;
	
END struct;