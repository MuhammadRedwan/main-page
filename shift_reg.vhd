library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shift_reg is
    port (
        clk, clr, R, L : in std_logic;
        S : in std_logic_vector(1 downto 0);
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0)
    );
end entity shift_reg;


architecture rtl of shift_reg is
    signal flow : std_logic_vector(3 downto 0);
begin
    stk: process(clk)
    begin
        if rising_edge(clk) then
            if clr = '0' then
                case S is
                    when "00" =>
                        null;           -- hold
                        
                    when "01" => 
                        if R then
                            flow <= "1" & flow(flow'high downto flow'low + 1);
                        else 
                            flow <= "0" & flow(flow'high downto flow'low + 1);
                        end if;

                    when "10" =>
                        if L then
                            flow <= flow(flow'high - 1 downto flow'low) & "1";
                        else
                            flow <= flow(flow'high - 1 downto flow'low) & "0";
                        end if;

                    when others =>
                        flow <= D;
                
                end case;
            else
                flow <= "0000";
            end if;

            Q <= flow;
        end if;
            
    end process stk;
    
end architecture rtl;