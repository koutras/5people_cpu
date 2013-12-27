library ieee;
use ieee.std_logic_1165.all;

entity controlUnit is
	port(
			--xreiazetai roloi????
			opcode: in std_logic_vector(7 downto 0);
			controlSignals: out std_logic_vector(X downto 0) --exartatai posa simata tha ginetai h execution unit	
	);
end controlUnit;

architecture controlUnit of controlUnit is
	--perilambanei to interrupt controller kai alla polla

	--dilwsi simatwn & metavlitwn
begin
	process(opcode)
	begin
		case opcode is
			when "00000001"=>
				controlSignals<="mpla mpla"; --entoli
				--do sth else
			when "00000002" .........
		end case;
	end process;
end controlUnit;
		
