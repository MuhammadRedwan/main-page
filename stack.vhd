library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity stack is
    generic ( 
        WIDTH : natural := 4 
    );
    port (
        clk, clr : in std_logic;
        S : in std_logic_vector(1 downto 0);
        A : in std_logic_vector(WIDTH-1 downto 0);
        Q : out std_logic_vector(WIDTH-1 downto 0)
    );
end entity stack;


architecture rtl of stack is

    component shift_reg
        port (
            clk, clr, R, L : in std_logic;
            S : in std_logic_vector(1 downto 0);
            D : in std_logic_vector(3 downto 0);
            Q : out std_logic_vector(3 downto 0)
        );
    end component; 

    type shift_reg_array is array (WIDTH-1 downto 0) of std_logic_vector(WIDTH-1 downto 0);
    signal internal : shift_reg_array;

    signal sr_sel : std_logic_vector(1 downto 0);

begin
    
    sr_sel <= "00" when S = "11" else S;

    stack_block: for i in 0 to WIDTH-1 generate
        
        comp_shift_reg : shift_reg
            port map(
                clk => clk,
                clr => clr,
                S   => sr_sel,
                R   => A(i),
                L   => internal(i)(0),
                D   => internal(i),
                Q   => internal(i)
            );

            Q(i) <= internal(i)(3);
    end generate stack_block;
    
    
end architecture rtl;