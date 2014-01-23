library IEEE;
use IEEE.std_logic_1164.all; 

entity execution_unit is 
port ( 
 MAR_WR: in std_logic; 
 MDR_DR: in std_logic; 
 MDR_OE: in std_logic; 
 MDR_WR: in std_logic; 
 
 RAR_WR: in std_logic; 
 RDR_DIR: in std_logic;
 RDR_OE: in std_logic; 
 RDR_WR: in std_logic; 
 
 IR_WR: in std_logic; 
 
 PC_INC: in std_logic; 
 PC_OE: in std_logic; 
 PC_WR: in std_logic;
 
 H_H: in std_logic;
 H_L: in std_logic; 
 H_OE: in std_logic; 
 H_WR: in std_logic; 
 
 SP_INC: in std_logic; 
 SP_DCR: in std_logic; 
 SP_RST: in std_logic;
 SP_OE: in std_logic; 
 
 LB_RST: in std_logic; 
 LB_OE: in std_logic;
 
 UB_RST: in std_logic; 
 UB_OE: in std_logic; 
 
 ALU_C1: in std_logic; 
 ALU_C2: in std_logic;
 ALU_C3: in std_logic; 
 ALU_C4: in std_logic; 
 C_EN: in std_logic;
 AC_WR: in std_logic; 
 AC_RST: in std_logic;
 AC_OE: in std_logic; 

Z: out std_logic; 
MAR: out std_logic; 
MDR: out std_logic; 
RAR: out std_logic;
RDR: out std_logic; 
IR: out std_logic;
PC: out std_logic; 
H: out std_logic; 
SP: out std_logic;
LB: out std_logic; 
UB: out std_logic 
); 
end execution_unit;

architecture execution_unit of execution_unit is
		component reg_buf is
			port(
			input : in std_logic_vector(15 downto 0);
			writeEnable,clk : in std_logic;
			output: out std_logic_vector(15 downto 0)
			);
		end component;

        component alu is
                port(
                         carryEnable : in std_logic;
                         cin : in std_logic;
                         R : in  std_logic_vector(7 downto 0);
                         S : in        std_logic_vector(7 downto 0);
                         sel : in std_logic_vector(2 downto 0);
                         dataOut : out std_logic_vector(7 downto 0);
                         clk : in std_logic;
                         carry : out std_logic;
                         sign : out std_logic;
                         overflow : out std_logic;
                         zero : out std_logic
                         
        );
        end component;
        
        component myRegisters is
		
		port
			(
		
				clk : in std_logic;
				address	: in  std_logic_vector(3 downto 0);
				data	: in std_logic_vector((8-1) downto 0);
				we	: in std_logic := '1';
				externalReset : in std_logic;
				q	: out std_logic_vector((8 -1) downto 0)
				
			);


	end component;
begin

end alu;