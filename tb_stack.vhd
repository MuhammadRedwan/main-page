library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_stack is
end entity tb_stack;

architecture sim of tb_stack is

    constant WIDTH : natural := 4;
    constant CLK_PERIOD : time := 10 ns;

    signal clk : std_logic := '0';
    signal clr : std_logic := '0';
    signal S   : std_logic_vector(1 downto 0) := "00";
    signal A   : std_logic_vector(WIDTH-1 downto 0) := "0000";
    signal Q   : std_logic_vector(WIDTH-1 downto 0);

begin

    -- Instantiate the DUT
    DUT: entity work.stack
        generic map (
            WIDTH => WIDTH
        )
        port map (
            clk => clk,
            clr => clr,
            S   => S,
            A   => A,
            Q   => Q
        );

    -- Clock generation
    clk_process : process
    begin
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
    end process;


    clr_process: process
    begin
        
        clr <= '0';
        wait for 20*CLK_PERIOD;
        clr <= '1';
        wait for 10*CLK_PERIOD;

    end process clr_process;

    s_process : process
    begin
        S <= "00";
        wait for 5*CLK_PERIOD;
        S <= "01";
        wait for 5*CLK_PERIOD;
        S <= "10";
        wait for 5*CLK_PERIOD;
        S <= "11";
        wait for 5*CLK_PERIOD;
    end process s_process;

    -- Stimulus process
    a_process : process
    begin

        A   <= "0000";
        wait for 2*CLK_PERIOD;

        A   <= "0001";
        wait for 2*CLK_PERIOD;

        A   <= "0010";
        wait for 2*CLK_PERIOD;

        A   <= "0011";
        wait for 2*CLK_PERIOD;

        A   <= "0100";
        wait for 2*CLK_PERIOD;

        A   <= "0101";
        wait for 2*CLK_PERIOD;

        A   <= "0110";
        wait for 2*CLK_PERIOD;

        A   <= "0111";
        wait for 2*CLK_PERIOD;

        A   <= "1000";
        wait for 2*CLK_PERIOD;

        A   <= "1001";
        wait for 2*CLK_PERIOD;

        A   <= "1010";
        wait for 2*CLK_PERIOD;

        A   <= "1011";
        wait for 2*CLK_PERIOD;

        A   <= "1100";
        wait for 2*CLK_PERIOD;

        A   <= "1101";
        wait for 2*CLK_PERIOD;
        
        A   <= "1110";
        wait for 2*CLK_PERIOD;

        A   <= "1111";
        wait for 2*CLK_PERIOD;
        
    end process;

end architecture sim;
