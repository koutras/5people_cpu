-- Quartus II VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_counter is


	port 
	(
		input : in signed(15 downto 0);
		oe: in std_logic;
		inc: in std_logic;
		wr: in std_logic;
		rst: in std_logic;
		clk: in std_logic;
		output: out signed(15 downto 0)
	
		
	);

end entity;

architecture rtl of pc_counter is

signal R1,R2 : signed(15 downto 0) := (others => '0');

begin

R1 <= input;


process(R2,oe)
	begin
	 if(oe='1') then
			output <= R2;	
		else
			output<=(others=>'Z');
		end if;

end process;

	
	
	process(wr,rst,clk,R1)
	begin
	   
	   if(rst='1') then
				R2<="000000000000000";
		end if;
		if clk'event and clk='1' then
			
			if(inc='1') then
				R2<=R1 + 1;
			end if;
			if(wr='1') then
				R2<=R1;
			end if;
		end if;
	end process;
			
	end rtl;
