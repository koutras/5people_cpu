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