-- Quartus II VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity  tristate_buffer is


	port 
	(
		input : in std_logic_vector(15 downto 0);
		enable: in std_logic;
		output: out std_logic_vector(15 downto 0)
	
		
	);

end entity;

architecture rtl of tristate_buffer is
begin
	process(enable,input)
	begin
		if(enable='1') then
				output<=input;
		else
			output<=(others=>'Z');
		end if;
	end process;
			
	end rtl;
