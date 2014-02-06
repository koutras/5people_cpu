library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

--log 6/2/2013 prosoxh sta shmata memory_address kai memory_data
-- ta opoia grafontai apo ton pc kai ton ac antistoixa by default, kai
-- exoun thn dunatothta na enhmerwthoun kai ta dyo apo to bus

entity execution_unit is
port (
clk : in std_logic;

 MM_WR : in std_logic;
 MM_OE : in std_logic;

 REG_WRA : in std_logic;
 REG_WRB : in std_logic;
 REG_OE : in std_logic; --enable tri-state buffer kataqwrhtwn
 


 PC_INC: in std_logic;
 PC_OE: in std_logic;
 PC_WR: in std_logic;
 PC_RST : in std_logic;
 
 AC_WR: in std_logic;
 AC_RST: in std_logic;
 AC_OE: in std_logic;
 
 ALU_OP: in std_logic_vector(2 downto 0);
 ALU_Z: out std_logic;
 ALU_C: out std_logic;
 ALU_V: out std_logic;
 ALU_S : out std_logic;
 C_EN: in std_logic;
 
 IR_WR: in std_logic;
 IR_OP: out signed(3 downto 0);



MDR: out std_logic_vector(7 downto 0) --den einai pragmatikos kataqwrhthc!

);
end execution_unit;

architecture rtl of execution_unit is



component pc_counter is

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

end component;


component ac is


	port 
	(
		input : in signed(15 downto 0);
		wr: in std_logic;
		oe: in std_logic;
		rst: in std_logic;
		clk: in std_logic;
		output: out signed(15 downto 0)
	
		
	);
end component;


component inr is


	port 
	(
		input : in signed(15 downto 0);
		wr: in std_logic;
		clk: in std_logic;
		output: out signed(3 downto 0)
	
		
	);

end component;

component registers is
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;

component alu is
port(  
        Clk : in std_logic; 
        A,B : in signed(7 downto 0); 
        Op : in std_logic_vector(2 downto 0); 
        R : out signed(7 downto 0);  
        Cen : in std_logic;
        C : out std_logic;
        V : out std_logic;
        Z : out std_logic       
        );
end component;

component  tristate_buffer is


	port 
	(
		input : in std_logic_vector(15 downto 0);
		enable: in std_logic;
		output: out std_logic_vector(15 downto 0)
	
		
	);

end component;

component main_memory IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;

        

signal mybus : signed(15 downto 0);
signal alu_output : signed(15 downto 0);
signal alu_output_us : std_logic_vector(15 downto 0);
signal mdr_high : std_logic_vector(7 downto 4);
signal mdr_low : std_logic_vector(3 downto 0);
signal mybus_us : std_logic_vector(15 downto 0);

signal temp_regs : std_logic_vector(15 downto 0);
signal temp_mm : std_logic_vector(7 downto 0); 

signal memory_address : std_logic_vector(15 downto 0);
signal memory_data : std_logic_vector(7 downto 0);
signal pc_output : std_logic_vector(15 downto 0);
signal ac_output : std_logic_vector(15 downto 0);


begin
c6 : main_memory port map (address=>memory_address, clock=>clk, data=>memory_data, wren=>MM_WR, q=>temp_mm);

c7 : tristate_buffer port map(input=>temp_mm,output=>mybus_us,enable=>MM_OE); --registers tri-state


c0 :pc_counter port map(input=>mybus(7 downto 0),oe=>PC_OE,inc=>PC_INC, wr=>PC_WR, rst=>PC_RST, clk=>clk, output=>memory_address);

c1 :ac port map(input=>alu_output,oe=>AC_OE,wr=>AC_WR, rst=>AC_RST, clk=>clk, output=>ac_output);

c2 :inr port map(input=>mybus,wr=>IR_WR,clk=>clk, output=>IR_OP);

c3: registers port map(address_a=>mybus_us(15 downto 8),
 address_b=>mybus_us(7 downto 0),clock=>clk,
data_a=>std_logic_vector(ac_output(15 downto 8)), --changed from alu output
data_b=>std_logic_vector(ac_output(7 downto 0)),
wren_a=>REG_WRA,wren_b=>REG_WRB,
q_a=>temp_regs(15 downto 8),q_b=>temp_regs(7 downto 0));

c4 : tristate_buffer port map(input=>temp_regs,output=>mybus_us,enable=>REG_OE); --registers tri-state




c5:alu port map (A=>mybus(15 downto 8),B=>mybus(7 downto 0),Op=>ALU_OP,Clk=>clk,C=>ALU_C,V=>ALU_V,Z=>ALU_Z,Cen=>C_EN,R=>alu_output);

--removed katia's alu an imported mine
--c5: alu port map(
 --			carryEnable =>C_EN,
--			 cin => carry,
--			 R => mybus(15 downto 8),
--			 S => mybus(7 downto 0),
--			 sel => ALU_OP,
--			 dataOut =>alu_ouput,
--			 clk  =>clk,
--			 carry=>carry,
--			 sign : ALU_S
--			 overflow => ALU_V,
--			 zero => ALU_Z
)

	
	
	process(clk,mybus_us,temp_mm,MM_WR)
	begin
		if rising_edge(clk) then
			if MM_WR='0' then
				MDR<=temp_mm;
			else
				MDR<=mybus_us;
			end if;
		end if;
		
	end process;
	
	
memory_address<= pc_output	when PC_OE='0'	else	mybus_us; --o pc parakamptei to bus kai enhmerwnei thd address	
memory_data<= ac_output	when AC_OE='0'	else	mybus_us; --o ac otan den vgazei exodo sto bus trofodotei tous registers me data
       
mybus<=signed(mybus_us);
end rtl;