-- Quartus II VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity  myRegister is


	port 
	(
		input : in std_logic_vector(15 downto 0);
		writeEnable: in std_logic;
		clk: in std_logic;
		output: out std_logic_vector(15 downto 0)
	
		
	);

end entity;

architecture rtl of myRegister is
begin
	process(writeEnable,clk,input)
	begin
		if clk'event and clk='1' then
			if(writeEnable='1') then
				output<=input;
			end if;
		end if;
	end process;
			
	end rtl;
