library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity reg_inc is
        port(
                        inAddress : in std_logic_vector(7 downto 0);
                        externalReset : in std_logic;
                        outAddress : out std_logic_vector(7 downto 0);
                        
                        clk : in std_logic);
end reg_inc;

architecture reg_inc of reg_inc is
begin
                process(clk,externalReset)
                begin
                        if(externalReset='1') then
                                outAddress<= (others=>'0');
                        elsif(clk'event and clk='1') then
                                outAddress <= inAddress + 1;
                        end if;
                end process;
end reg_inc;