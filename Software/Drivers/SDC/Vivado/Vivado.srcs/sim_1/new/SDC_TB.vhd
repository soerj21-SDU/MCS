library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_SDC_Monitor_CAR is
end entity TB_SDC_Monitor_CAR;

architecture Behavioral of TB_SDC_Monitor_CAR is

    -- Signals for driving the UUT. Inverse logic: 
    signal CLK_I : std_logic := '0';

    signal SDC_SUPPLY_I : std_logic := '0';
    signal COCKPIT_EMERGENCY_I : std_logic := '0';
    signal BOTS_I : std_logic := '0';
    signal INERTIA_I : std_logic := '0';
    signal L_EMERGENCY_BUTTON_I : std_logic := '0';
    signal R_EMERGENCY_BUTTON_I : std_logic := '0';
    signal FR_WHEEL_I : std_logic := '0';
    signal FL_WHEEL_I : std_logic := '0';
    signal RR_WHEEL_I : std_logic := '0';
    signal RL_WHEEL_I : std_logic := '0';

    signal TSAC_HV_CONNECTOR_I : std_logic := '0';
    signal TSAC_IMD_I : std_logic := '0';
    signal TSAC_AMS_ENABLE_I : std_logic := '0';

    signal BSPD_I : std_logic := '0';
    signal HVD_I : std_logic := '0';
    signal TSMP_I : std_logic := '0';
    signal TSMS_I : std_logic := '1'; -- purposefully set to "1"

    signal SDC_NOT_CLOSED_VECTOR_O : std_logic_vector(16 downto 0);

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: entity work.SDC_Monitor_CAR
        generic map 
        (
            NO_OF_SDC_NODES => 17,
            ClK_divider => 1 -- Divide 100 MHz clk to 1 MHz.
        )
        port map 
        (
            CLK_I => CLK_I,

            SDC_SUPPLY_I => SDC_SUPPLY_I,
            COCKPIT_EMERGENCY_I => COCKPIT_EMERGENCY_I,
            BOTS_I => BOTS_I,
            INERTIA_I => INERTIA_I,
            L_EMERGENCY_BUTTON_I => L_EMERGENCY_BUTTON_I,
            R_EMERGENCY_BUTTON_I => R_EMERGENCY_BUTTON_I,
            FR_WHEEL_I => FR_WHEEL_I,
            FL_WHEEL_I => FL_WHEEL_I,
            RR_WHEEL_I => RR_WHEEL_I,
            RL_WHEEL_I => RL_WHEEL_I,
            TSAC_HV_CONNECTOR_I => TSAC_HV_CONNECTOR_I,
            TSAC_IMD_I => TSAC_IMD_I,
            TSAC_AMS_ENABLE_I => TSAC_AMS_ENABLE_I,
            BSPD_I => BSPD_I,
            HVD_I => HVD_I,
            TSMP_I => TSMP_I,
            TSMS_I => TSMS_I,

            SDC_VECTOR_O => SDC_VECTOR_O
        );

    -- Generate clock signal
    clk_process: process
    begin
        CLK_I <= '0';
        wait for CLK_PERIOD / 2;
        CLK_I <= '1';
        wait for CLK_PERIOD / 2;
    end process;


    -- Stimulate inputs
    stimulus_process: process
    begin
        -- Wait for startup delay
        wait for 10 ns;

        -- test inputs
        TSMS_I <= '0'; 
        wait for 10 ns;

        -- Change inputs
        BOTS_I <= '1';
        INERTIA_I <= '1';
        wait for 10 ns;

        BOTS_I <= '0';
        INERTIA_I <= '0';
        wait for 10 ns;

        SDC_SUPPLY_I <= '1';
        wait for 10 ns;

        TSMS_I <= '1'; 
        wait for 10 ns;

        SDC_SUPPLY_I <= '0';
        wait for 10 ns;
        
        TSMS_I <= '0'; 
        -- End simulation
        wait;
    end process;

end architecture Behavioral;
