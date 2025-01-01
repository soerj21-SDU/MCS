
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.std_logic_arith.all;
-- use IEEE.std_logic_signed.all;
-- use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity SDC_Monitor_CAR is --
    generic 
    (
        NO_OF_SDC_NODES : integer := 17;
        ClK_divider  : integer := 100_000_000  
        );
    port 
    ( 
        CLK_I                    : in std_logic;


     -- SDC pins are inverse logic!!!

     -- Car-side of the SDC:
        SDC_SUPPLY_I             : in std_logic := '1'; -- initialized to "all open" per default
        COCKPIT_EMERGENCY_I      : in std_logic := '1'; 
        BOTS_I                   : in std_logic := '1'; 
        INERTIA_I                : in std_logic := '1'; 
        L_EMERGENCY_BUTTON_I     : in std_logic := '1'; 
        R_EMERGENCY_BUTTON_I     : in std_logic := '1'; 
        FR_WHEEL_I               : in std_logic := '1'; 
        FL_WHEEL_I               : in std_logic := '1'; 
        RR_WHEEL_I               : in std_logic := '1'; 
        RL_WHEEL_I               : in std_logic := '1'; 

     -- ACCU-side of the SDC:
        TSAC_HV_CONNECTOR_I           : in std_logic := '0';  -- Always considered closed. When able to test with accumulator (or simulator) change to "0".
        TSAC_IMD_I                    : in std_logic := '0'; 
        TSAC_AMS_ENABLE_I             : in std_logic := '0'; 

     -- Car-side of the SDC:
        BSPD_I                   : in std_logic := '1'; 
        HVD_I                    : in std_logic := '1'; 

     -- Uncomment the inputs below if test-pins have been added to the SDC:
     -- FR_MOTOR_I               : in std_logic;
     -- FL_MOTOR_I               : in std_logic;
     -- RR_MOTOR_I               : in std_logic;
     -- RL_MOTOR_I               : in std_logic;

        TSMP_I                   : in Std_logic := '0'; 
        TSMS_I                   : in std_logic := '0'; 

        SDC_NOT_CLOSED_VECTOR_O   : out std_logic_vector (NO_OF_SDC_NODES-1 downto 0) := (others => '0') -- up to "SDC Enable"-relay. Default: all nodes OPEN.
    );
end entity SDC_Monitor_CAR;


architecture Behavioral of SDC_Monitor_CAR is
    constant SDC_SUPPLY_INDEX        : integer := 0;
    constant Cockpit_emergency_index : integer := 1; 
    constant BOTS_index              : integer := 2; 
    constant inertia_index           : integer := 3; 
    constant L_emergency_btn_index   : integer := 4; 
    constant R_emergency_btn_index   : integer := 5; 
    constant FR_wheel_index          : integer := 6; 
    constant FL_wheel_index          : integer := 7; 
    constant RR_wheel_index          : integer := 8; 
    constant RL_wheel_index          : integer := 9; 
    constant TSAC_HV_Connector_index : integer := 10;
    constant TSAC_IMD_Index          : integer := 11;
    constant TSAC_AMS_index          : integer := 12;
    constant BSPD_index              : integer := 13; 
    constant HVD_index               : integer := 14; 
    constant TSMP_index              : integer := 15; 
    constant TSMS_index              : integer := 16; 

    signal SDC_STATUS_VECTOR : STD_LOGIC_VECTOR(NO_OF_SDC_NODES-1 downto 0); 

    signal counter :  integer := 0;
    signal StartUp_Enable : std_logic := '0'; 

    -- attribute KEEP : string;
    -- ATTRIBUTE MARK_DEBUG : STRING;

    -- ATTRIBUTE KEEP OF SDC_STATUS_VECTOR : SIGNAL IS "true";
    -- ATTRIBUTE MARK_DEBUG OF SDC_STATUS_VECTOR : SIGNAL IS "true";
    -- ATTRIBUTE MARK_DEBUG OF counter : SIGNAL IS "true";
    -- ATTRIBUTE MARK_DEBUG OF startup_delay_1sec : SIGNAL IS "true";
        
begin
    SDC_STATUS_VECTOR( SDC_SUPPLY_INDEX)         <= SDC_SUPPLY_I;
    SDC_STATUS_VECTOR( cockpit_emergency_index ) <= COCKPIT_EMERGENCY_I;
    SDC_STATUS_VECTOR( BOTS_index )              <= BOTS_I;
    SDC_STATUS_VECTOR( inertia_index )           <= Inertia_I;
    SDC_STATUS_VECTOR( L_emergency_btn_index )   <= L_emergency_button_I;
    SDC_STATUS_VECTOR( R_emergency_btn_index )   <= R_emergency_button_I;
    SDC_STATUS_VECTOR( FR_wheel_index )          <= FR_wheel_I;
    SDC_STATUS_VECTOR( FL_wheel_index )          <= FL_wheel_I;
    SDC_STATUS_VECTOR( RR_wheel_index )          <= RR_wheel_I;
    SDC_STATUS_VECTOR( RL_wheel_index )          <= RL_wheel_I;
    SDC_STATUS_VECTOR( TSAC_HV_Connector_index ) <= TSAC_HV_Connector_I;
    SDC_STATUS_VECTOR( TSAC_IMD_Index )          <= TSAC_IMD_I;
    SDC_STATUS_VECTOR( TSAC_AMS_index )          <= TSAC_AMS_Enable_I;
    SDC_STATUS_VECTOR( BSPD_index )              <= BSPD_I;
    SDC_STATUS_VECTOR( HVD_index )               <= HVD_I;
    SDC_STATUS_VECTOR( TSMP_index )              <= TSMP_I;
    SDC_STATUS_VECTOR( TSMS_index )              <= TSMS_I;


    process (SDC_STATUS_VECTOR) begin -- enter if a node changes state. 
        if (StartUp_Enable = '1') then -- only send data after X amount of time
            SDC_NOT_CLOSED_VECTOR_O <= SDC_STATUS_VECTOR; 
        end if; 
    end process;


    process(CLK_I) begin --enable the signal after 1 second.
        if( rising_edge(CLK_I) AND (StartUp_Enable = '0') ) then
            if (counter >= CLK_divider) then
                StartUp_Enable <= '1';  
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;


end architecture Behavioral;
