library ieee;
use ieee.std_logic_1164.all;

entity controlUnit is
	port(
			--inputs
			 clk: in std_logic;
			 opcode: in std_logic_vector(7 downto 0);
			 Z: in std_logic; 
			 int1 : in std_logic;
			 int2 : in std_logic;
			 
			 bus16 : in std_logic_vector(15 downto 0);
			 
			 
			 --outputs
			 MAR_WR: out std_logic; 
			 
			 MDR_DR: out std_logic; 
			 MDR_OE: out std_logic; 
			 MDR_WR: out std_logic; 
			 
			 RAR_WR: out std_logic; 
			 RDR_DIR: out std_logic;
			 RDR_OE: out std_logic; 
			 RDR_WR: out std_logic; 
			 
			 IR_WR: out std_logic; 
			 
			 PC_outC: out std_logic; 
			 PC_OE: out std_logic; 
			 PC_WR: out std_logic;
			 
			 H_H: out std_logic;
			 H_L: out std_logic; 
			 H_OE: out std_logic; 
			 H_WR: out std_logic; 
			 
			 SP_outC: out std_logic; 
			 SP_DCR: out std_logic; 
			 SP_RST: out std_logic;
			 SP_OE: out std_logic; 
			 
			 LB_RST: out std_logic; 
			 LB_OE: out std_logic;
			 
			 UB_RST: out std_logic; 
			 UB_OE: out std_logic; 
			 
			 ALU_C1: out std_logic; 
			 ALU_C2: out std_logic;
			 ALU_C3: out std_logic; 
			 ALU_C4: out std_logic; 
			 C_EN: out std_logic;
			 AC_WR: out std_logic; 
			 AC_RST: out std_logic;
			 AC_OE: out std_logic
			
			
			
--			MAR: out std_logic; 
--			MDR: out std_logic; 
--			RAR: out std_logic;
--			RDR: out std_logic; 
--			IR: out std_logic;
--			PC: out std_logic; 
--			H: out std_logic; 
--			SP: out std_logic;
--			LB: out std_logic; 
--			UB: out std_logic 
	);
end controlUnit;

architecture controlUnit of controlUnit is


	component heap --ylopoiisi tou heap, arxika me flip flop
	end component
	
	
	--perilambanei to interrupt controller kai alla polla

	--dilwsi simatwn & metavlitwn
	 type state is(fetch0,fetch1,fetch2,move_r1_r2,load_r_d0);
	signal prState,nxState : state; --present state next state
	 
	
begin
	process(opcode)
	begin
		case opcode is
			when "00000000" =>
			 prState<=fetch0;
				
			 MAR_WR<='0'; 
			 
			 MDR_DR<='0'; 
			 MDR_OE<='0'; 
			 MDR_WR<='0'; 
			 
			 RAR_WR<='0'; 
			 RDR_DIR<='0';
			 RDR_OE<='0'; 
			 RDR_WR<='0'; 
			 
			 IR_WR<='0'; 
			 
			 PC_outC<='0'; 
			 PC_OE<='0'; 
			 PC_WR<='0';
			 
			 H_H<='0';
			 H_L<='0'; 
			 H_OE<='0'; 
			 H_WR<='0'; 
			 
			 SP_outC<='0'; 
			 SP_DCR<='0'; 
			 SP_RST<='0';
			 SP_OE<='0'; 
			 
			 LB_RST<='0'; 
			 LB_OE<='0';
			 
			 UB_RST<='0'; 
			 UB_OE<='0'; 
			 
			 ALU_C1<='0'; 
			 ALU_C2<='0';
			 ALU_C3<='0'; 
			 ALU_C4<='0'; 
			 C_EN<='0';
			 AC_WR<='0'; 
			 AC_RST<='0';
			 AC_OE<='0'
			
			when "00000001"=> load_r_d0;
				controlSignals<="mpla mpla"; --entoli
				--do sth else
			when "00000010" =>move_r1_r2;
			when "00000011" =>
			when "00000100" =>
			when "00000101" =>
			when "00000110" =>
			when "00000111" =>
			when "00001000" =>
			when "00001001" =>
			when "00001010" =>
			when "00001011" =>
			when "00001100" =>
			when "00001101" =>
			when "00001110" =>
			when "00001111" =>
			when "00010000" =>
			when "00010001" =>
			when "00010010" =>
			when "00010011" =>
			when "00010100" =>
			when "00010101" =>
			when "00010110" =>
			when others=> prState=>fetch0;
			
		end case;
	end process;
	
	process(prState) --metabash apo ena state sto allo
	begin
		when fetch0=> state<=fetch1;
		when fetch1=> state<=fetch2;
	end process
	
	process(int1,int2) --xeirismos twn diakopwn
	end process; 
end controlUnit;
		
