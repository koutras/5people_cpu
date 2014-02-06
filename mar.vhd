-- Quartus II VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mar is


	port 
	(
		input : in std_logic_vector(15 downto 0);
		wr: in std_logic;
		clk: in std_logic;
		output: out std_logic_vector(15 downto 0)
	
		
	);

end entity;

architecture rtl of mar is
begin
	process(wr,clk,input)
	begin
		if clk'event and clk='1' then
			if(wr='1')then
				output<=input;
			end if;
		end if;
	end process;
			
	end rtl;
