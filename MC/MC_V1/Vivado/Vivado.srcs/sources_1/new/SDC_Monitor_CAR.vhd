
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.std_logic_arith.all;
-- use IEEE.std_logic_signed.all;
-- use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity SDC_Monitor_CAR is
    generic 
    (
        No_of_inputs : integer := 16;
        ClK_divider  : natural := 100_000_000  
        );
    port 
    ( 
        CLK_I                    : in std_logic;

     -- Master Controller part of the SDC:
        SDC_SUPPLY_I             : in std_logic := '1'; -- initialized to "all closed" per default
        COCKPIT_EMERGENCY_I      : in std_logic := '1'; 
        BOTS_I                   : in std_logic := '1'; 
        INERTIA_I                : in std_logic := '1'; 
        L_EMERGENCY_BUTTON_I     : in std_logic := '1'; 
        R_EMERGENCY_BUTTON_I     : in std_logic := '1'; 
        FR_WHEEL_I               : in std_logic := '1'; 
        FL_WHEEL_I               : in std_logic := '1'; 
        RR_WHEEL_I               : in std_logic := '1'; 
        RL_WHEEL_I               : in std_logic := '1'; 

     -- TSAC-part of the SDC:
        TSAC_HV_CONNECTOR_I           : in std_logic := '1'; 
        TSAC_IMD_I                    : in std_logic := '1'; 
        TSAC_AMS_ENABLE_I             : in std_logic := '1'; 

     -- Master Controller part of the SDC:
        BSPD_I                   : in std_logic := '1'; 
        HVD_I                    : in std_logic := '1'; 

     -- Uncomment the inputs below if test-pins have been added to the SDC:
     -- FR_MOTOR_I               : in std_logic;
     -- FL_MOTOR_I               : in std_logic;
     -- RR_MOTOR_I               : in std_logic;
     -- RL_MOTOR_I               : in std_logic;

        TSMP_I                   : in Std_logic := '1'; 
        TSMS_I                   : in std_logic := '1'; 

        IS_SDC_CLOSED_VECTOR_O   : out std_logic_vector (No_of_inputs-1 downto 0) := (others => '0') -- up to "SDC Enable"-relay. Default: all nodes OPEN.
    );
end entity SDC_Monitor_CAR;


architecture Behavioral of SDC_Monitor_CAR is 
    constant Cockpit_emergency_index : integer := 0; 
    constant BOTS_index              : integer := 1; 
    constant inertia_index           : integer := 2; 
    constant L_emergency_btn_index   : integer := 3; 
    constant R_emergency_btn_index   : integer := 4; 
    constant FR_wheel_index          : integer := 5; 
    constant FL_wheel_index          : integer := 6; 
    constant RR_wheel_index          : integer := 7; 
    constant RL_wheel_index          : integer := 8; 
    constant TSAC_HV_Connector_index : integer := 9;
    constant TSAC_IMD_Index          : integer := 10;
    constant TSAC_AMS_index          : integer := 11;
    constant BSPD_index              : integer := 12; 
    constant HVD_index               : integer := 13; 
    constant TSMP_index              : integer := 14; 
    constant TSMS_index              : integer := 15; 

    signal IS_SDC_CLOSED_VECTOR : STD_LOGIC_VECTOR(No_of_inputs-1 downto 0); 

    signal counter :  natural := 0;
    signal clock_1Hz_enable : std_logic; 
    signal startup_delay_1sec : std_logic := '0'; 


begin
    IS_SDC_CLOSED_VECTOR( cockpit_emergency_index ) <= COCKPIT_EMERGENCY_I;
    IS_SDC_CLOSED_VECTOR( BOTS_index )              <= BOTS_I;
    IS_SDC_CLOSED_VECTOR( inertia_index )           <= Inertia_I;
    IS_SDC_CLOSED_VECTOR( L_emergency_btn_index )   <= L_emergency_button_I;
    IS_SDC_CLOSED_VECTOR( R_emergency_btn_index )   <= R_emergency_button_I;
    IS_SDC_CLOSED_VECTOR( FR_wheel_index )          <= FR_wheel_I;
    IS_SDC_CLOSED_VECTOR( FL_wheel_index )          <= FL_wheel_I;
    IS_SDC_CLOSED_VECTOR( RR_wheel_index )          <= RR_wheel_I;
    IS_SDC_CLOSED_VECTOR( RL_wheel_index )          <= RL_wheel_I;
    IS_SDC_CLOSED_VECTOR( TSAC_HV_Connector_index ) <= TSAC_HV_Connector_I;
    IS_SDC_CLOSED_VECTOR( TSAC_IMD_Index )          <= TSAC_IMD_I;
    IS_SDC_CLOSED_VECTOR( TSAC_AMS_index )          <= TSAC_AMS_Enable_I;
    IS_SDC_CLOSED_VECTOR( BSPD_index )              <= BSPD_I;
    IS_SDC_CLOSED_VECTOR( HVD_index )               <= HVD_I;
    IS_SDC_CLOSED_VECTOR( TSMP_index )              <= TSMP_I;
    IS_SDC_CLOSED_VECTOR( TSMS_index )              <= TSMS_I;


    process (IS_SDC_CLOSED_VECTOR, clock_1Hz_enable) begin
        if (startup_delay_1sec = '1') then -- if we have waited for 1 second after startup...
            IS_SDC_CLOSED_VECTOR_O <= IS_SDC_CLOSED_VECTOR; -- change output if inputs change. 
        end if; 
    end process;


    process(CLK_I) begin
        if(rising_edge(CLK_I)) then
            if counter = CLK_divider then
                counter <= 0;
                clock_1Hz_enable <= '1';
                startup_delay_1sec <= '1';  
            else
                clock_1Hz_enable <= '0';
                counter <= counter + 1;
            end if;
        end if;
    end process;


end architecture Behavioral;
