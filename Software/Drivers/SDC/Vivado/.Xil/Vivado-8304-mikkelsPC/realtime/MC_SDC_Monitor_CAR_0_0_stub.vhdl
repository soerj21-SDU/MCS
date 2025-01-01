-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MC_SDC_Monitor_CAR_0_0 is
  Port ( 
    CLK_I : in STD_LOGIC;
    SDC_SUPPLY_I : in STD_LOGIC;
    COCKPIT_EMERGENCY_I : in STD_LOGIC;
    BOTS_I : in STD_LOGIC;
    INERTIA_I : in STD_LOGIC;
    L_EMERGENCY_BUTTON_I : in STD_LOGIC;
    R_EMERGENCY_BUTTON_I : in STD_LOGIC;
    FR_WHEEL_I : in STD_LOGIC;
    FL_WHEEL_I : in STD_LOGIC;
    RR_WHEEL_I : in STD_LOGIC;
    RL_WHEEL_I : in STD_LOGIC;
    TSAC_HV_CONNECTOR_I : in STD_LOGIC;
    TSAC_IMD_I : in STD_LOGIC;
    TSAC_AMS_ENABLE_I : in STD_LOGIC;
    BSPD_I : in STD_LOGIC;
    HVD_I : in STD_LOGIC;
    TSMP_I : in STD_LOGIC;
    TSMS_I : in STD_LOGIC;
    SDC_VECTOR_O : out STD_LOGIC_VECTOR ( 16 downto 0 )
  );

end MC_SDC_Monitor_CAR_0_0;

architecture stub of MC_SDC_Monitor_CAR_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "SDC_Monitor_CAR,Vivado 2024.1";
begin
end;
