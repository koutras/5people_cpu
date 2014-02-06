library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
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
end alu;

architecture Behavioral of alu is


signal Reg1,Reg2,Reg3 : signed(7 downto 0) := (others => '0');

begin

Reg1 <= A;
Reg2 <= B;
R <= Reg3;

process(Clk)
begin

    if(rising_edge(Clk)) then 
        case Op is
            when "000" =>
                Reg3 <= B;  
            when "001" =>
                Reg3 <= Reg1 + Reg2; 
            when "010" =>
                Reg3 <= Reg1 - Reg2; 
            when "011" =>
                Reg3 <= Reg1 and Reg2;  
            when "100" =>
                Reg3 <= Reg1 or Reg2;  
            when "101" =>
                Reg3 <= Reg1 xor Reg2; 
            when "110" =>
                Reg3 <= Reg1 + 1; 
            when "111" =>
                Reg3 <= Reg1 - 1;             
            
            when others =>
                NULL;
        end case;     
        if (Cen='1') then
           Reg3<=Reg3+1;
        end if;  
        if (Reg3=0) then
           Z<='1';
        end if; 
        
        if (Op = "001" and (Reg1 + Reg2 > (8))) then 
           C <= '1';
           V <= '1';
        else
           C <= '0';
           V <= '0';
        end if;
        
    end if;
   
end process;   

end Behavioral;