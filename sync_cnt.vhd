library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sync_cnt is
    port (
        D : in std_logic_vector(3 downto 0);
        clr, ld, updwn, en, clk: in std_logic;
        overflow : out std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end entity sync_cnt;


architecture rtl of sync_cnt is
    signal num : unsigned(3 downto 0) := "0000";
begin
    
    proc_name: process(clk, clr, en, ld, updwn)
    begin
        if rising_edge(clk) then
            if clr = '0' then
                if (en = '1') then
                    if (ld = '0') then
                        if (updwn = '0') then
                            if (num = 0) then
                                overflow <= '1';
                                num <= to_unsigned(15, 4);
                            else
                                overflow <= '0';
                                num <= num - 1;
                            end if;
                        else
                            if (num = 15) then
                                overflow <= '1';
                                num <= to_unsigned(0, 4);
                            else
                                overflow <= '0';
                                num <= num + 1;
                            end if;
                        end if;
                    else
                        num <= unsigned(D);
                        overflow <= '0';
                    end if;
                else
                    overflow <= '0';
                end if;
            else
                overflow <= '0';
                num <= to_unsigned(0, 4);
            end if;
        end if;
    end process proc_name;

    Q <= std_logic_vector(num);
    
    
end architecture rtl;