library IEEE;
use IEEE.std_logic_1164.all; 

--vasiki ontothta kataxwrhth
--antistoixa tha dimiourgithoun kataxwrites
-- 8/16 bit pou yposthrizoun leitourgies:
-- 1)reset
-- 2)increase
-- 3)decrease
-- 
-- 4)high low gia 16bit kataxwrhth H
-- 5) direction gia RDR

entity reg_buf is
	port(
	input : in std_logic_vector(15 downto 0);
	writeEnable,clk : in std_logic;
	output: out std_logic_vector(15 downto 0)
	);
end reg_buf;

architecture STRUCTURE of reg_buf is

component myRegister
port 
	(
		input : in std_logic_vector(15 downto 0);
		writeEnable: in std_logic;
		clk: in std_logic;
		output: out std_logic_vector(15 downto 0)
	
		
	);
end component;

component tristate_buffer
port 
	(
		input : in std_logic_vector(15 downto 0);
		enable: in std_logic;
		output: out std_logic_vector(15 downto 0)
	
		
	);
end component;

signal enableR: std_logic;
signal enableB:  std_logic;

signal input_R :  std_logic_vector(15 downto 0);
signal input_B :  std_logic_vector(15 downto 0);
signal output_R:  std_logic_vector(15 downto 0);
signal output_B:  std_logic_vector(15 downto 0);

begin 
uR: myRegister 
	port map (input=>input_R,writeEnable=>enableR,clk=>clk,output=>output_R);
	
uB: tristate_buffer 
	port map (input=>input_B,enable=>enableB,output=>output_B);

output<=output_B;	
end STRUCTURE;