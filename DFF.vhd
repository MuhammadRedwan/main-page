library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DFF is
    port (
        Clk, InputSignal : in std_logic;
        Edge : out std_logic
    );
end entity DFF;


architecture Behavioral of DFF is
    
    signal dff_out1, dff_out2 : std_logic;
begin
    
    edge_detection: process(Clk, InputSignal)
    begin
        if rising_edge(Clk) then
            dff_out1 <= InputSignal;
            dff_out2 <= dff_out1; 
        end if;

        Edge <= dff_out1 and not dff_out2;

    end process edge_detection;
    
end architecture Behavioral;