-- Simple Flip-flop
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity simple_ff is
    port (
        
        clk, rst, enable, input : in std_logic;
        output : out std_logic
    );
end entity simple_ff;

architecture sync of simple_ff is
    
begin
    
    sync_process: process(clk)
    begin
        if rising_edge(clk) then
            output <= input; 
        end if;
    end process sync_process;
    
end architecture sync;


architecture async of simple_ff is
    
begin
    
    async_process: process(clk, rst)
    begin
        if rst = '0' then
            output <= '0';
        elsif rising_edge(clk) then
            output <= input;
        end if;
    end process async_process;
    
    
end architecture async;


architecture enable_arch of simple_ff is
    
begin
    
    enable_process: process(clk, rst, enable)
    begin
        if rst = '0' then
            output <= '0';
        elsif rising_edge(clk) then
            if (enable = '1') then
                output <= input;
            end if;
        end if;
    end process enable_process;
    
end architecture enable_arch;