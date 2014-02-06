library ieee;
use ieee.std_logic_1164.all;

entity controlUnit is
	port(
	clk : in std_logic;
	rst : in std_logic;

	 MM_WR : out std_logic;
	 MM_OE : out std_logic;
	
	 REG_WRA : out std_logic;
	 REG_WRB : out std_logic;
	 REG_OE : out std_logic; --enable tri-state buffer kataqwrhtwn
	 
	
	
	 PC_INC: out std_logic;
	 PC_OE: out std_logic;
	 PC_WR: out std_logic;
	 PC_RST : out std_logic;
	 
	 AC_WR: out std_logic;
	 AC_RST: out std_logic;
	 AC_OE: out std_logic;
	 
	 ALU_OP: out std_logic_vector(2 downto 0);
	 ALU_Z: in std_logic;
	 ALU_C: in std_logic;
	 ALU_V: in std_logic;
	 ALU_S : in std_logic;
	 
	 C_EN: out std_logic;
	 
	 IR_WR: out std_logic;
	 IR_OP: in signed(3 downto 0);
			
			

	);
end controlUnit;

architecture controlUnit of controlUnit is


	
	
	--constant
	constant passB : std_logic_vector:="000";

	--dilwsi simatwn & metavlitwn
	 type state is(fetch_0,fetch_1,fetch_2,move_r1_r2_0,load_r_d0,load_r_a_0 );
	signal prState,nxState : state; --present state next state
	 
	
begin
	process(IR_OP) --arxikopoiei to prwto state diavazei to IR_OP kai metavainei sthn prwth katastash
	begin
	--when "00000000" =>nxState<=fetch_0;
		when "00000001"=> nxState<=load_r_d_0;
		when "00000010" =>nxState<=move_r1_r2_0;
		when "00000011" =>nxState<=load_r_a_0;
	--	when "00000100" =>
	--	when "00000101" =>
	--	when "00000110" =>
	--	when "00000111" =>
	--	when "00001000" =>
	--	when "00001001" =>
	--	when "00001010" =>
	--	when "00001011" =>
	--	when "00001100" =>
	--	when "00001101" =>
	--	when "00001110" =>
	--	when "00001111" =>
	--	when "00010000" =>
	--	when "00010001" =>
	--	when "00010010" =>
	--	when "00010011" =>
	--	when "00010100" =>
	--	when "00010101" =>
	--	when "00010110" =>
		when others=> prState=>fetch_0;
		
	end  process
	
	
	
	process(prState) --give signals according to state
	begin
		case prState is
			when fetch_0 =>
				--MAR<-PC
				
				 nxState<=fetch_1; --dhlwnw poio tha einai to epomeno state
					
		
				 MM_WR 			<='0';
				 MM_OE		    <='0';
				
				 REG_WRA	    <='0';
				 REG_WRB 		<='0';
				 REG_OE 		<='0';--enable tri-state buffer kataqwrhtwn
				 
				
				
				 PC_INC 		<='0';
				 PC_OE 			<='0';
				 PC_WR 			<='1';
				 PC_RST 		<='0';
				 
				 AC_WR 			<='0';
				 AC_RST		    <='0';
				 AC_OE 			<='0';
				 
				 ALU_OP 		<=passB;
				 C_EN			<='0';
				 
				 IR_WR 			<='0';
				 
			when fetch_1 =>
				--PC++ , IR<-memory
				 MM_WR 			<='0';
				 MM_OE		    <='0';
				
				 REG_WRA	    <='0';
				 REG_WRB 		<='0';
				 REG_OE 		<='0';--enable tri-state buffer kataqwrhtwn
				 
				
				
				 PC_INC 		<='1';
				 PC_OE 			<='0'; --ouput pc to mar (without bus)
				 PC_WR 			<='0';
				 PC_RST 		<='0';
				 
				 AC_WR 			<='0';
				 AC_RST		    <='0';
				 AC_OE 			<='0';
				 
				 ALU_OP 		<=passB;
				 C_EN			<='0';
				 
				 IR_WR 			<='1'; -- read ir from bus
				 
			when load_r_d_0 => --assumes reading d before R
				
				nxState<=load_r_d_1; --dhlwnw poio tha einai to epomeno state
								
				 MM_WR 			<='0';
				 MM_OE		    <='0';
				
				 REG_WRA	    <='0';
				 REG_WRB 		<='0';
				 REG_OE 		<='0';--enable tri-state buffer kataqwrhtwn
				 
				
				
				 PC_INC 		<='1';
				 PC_OE 			<='0';
				 PC_WR 			<='0';
				 PC_RST 		<='0';
				 
				 AC_WR 			<='1';
				 AC_RST		    <='0';
				 AC_OE 			<='0';
				 
				 ALU_OP 		<=passB;
				 C_EN			<='0';
				 
				 IR_WR 			<='0';
				 
			when load_r_d_1 => --reads R
				
				nxState<=load_r_d_2; --dhlwnw poio tha einai to epomeno state
								
				 MM_WR 			<='0';
				 MM_OE		    <='0';
				
				 REG_WRA	    <='0';
				 REG_WRB 		<='0';
				 REG_OE 		<='0';--enable tri-state buffer kataqwrhtwn
				 
				
				
				 PC_INC 		<='1';
				 PC_OE 			<='0';
				 PC_WR 			<='0';
				 PC_RST 		<='0';
				 
				 AC_WR 			<='0';
				 AC_RST		    <='0';
				 AC_OE 			<='0';
				 
				 ALU_OP 		<=passB;
				 C_EN			<='0';
				 
				 IR_WR 			<='0';
				
			 
			
			
			
		end case;
	end process;
	
	process(clk,rst) --metabash apo ena state sto allo
	begin
		if (rst='1') then
			prState<=fetch_0;
		elsif rising_edge(clk)
			prState<=nxState;
		end if;
	end process
	
	
end controlUnit;
		
