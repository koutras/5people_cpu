--kataxwrites genikou skopou
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity myRegisters is

	port
	(

		clk : in std_logic;
		address	: in  std_logic_vector(3 downto 0);
		data	: in std_logic_vector((8-1) downto 0);
		we	: in std_logic := '1';
		externalReset : in std_logic;
		q	: out std_logic_vector((8 -1) downto 0)
		
	);

end myRegisters;

architecture rtl of myRegisters is

	-- Build a 2-D array type for the RAM
	subtype word_t is std_logic_vector((8-1) downto 0);
	type memory_t is array(2**4-1 downto 0) of word_t;

	-- Declare the RAM 
	shared variable ram : memory_t;

begin
	--process(inclock)
	process(clk,externalReset)
	begin
		if(externalReset='1') then
			for i in 0 to 15 loop
				ram(i):=(others=>'0');
			end loop;
		elsif(clk'event and clk='1') then
			if(we='1') then
				ram(conv_integer(address)):=data;
			else
				q<=ram(conv_integer(address));
			end if;	
		end if;
	end process;
	
	
	
end rtl;
