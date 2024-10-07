
#     _____
#    /     \
#   /____   \____
#  / \===\   \==/
# /___\===\___\/  AVNET ELECTRONICS MARKETING
#      \======/         www.picozed.org
#       \====/    
# ----------------------------------------------------------------------------
# 
#  Created With Avnet Constraints Generator V0.8.0 
#     Date: Monday, December 22, 2014 
#     Time: 6:01:31 PM 
# 
#  This design is the property of Avnet.  Publication of this
#  design is not authorized without written consent from Avnet.
#  
#  Please direct any questions to:
#     Avnet Technical Community Forums
#     http://picozed.org/forum
# 
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2014 Avnet, Inc.
#                              All rights reserved.
# 
# ----------------------------------------------------------------------------
# 
#  Notes: 
#
#  Monday, April 20, 2015
#
#     IO standards based upon Bank 34, Bank 35, and Bank 13 Vcco supply 
#     of 1.8V requires bank VCCO voltage to be set to 1.8V.
#
#     Net names are not allowed to contain hyphen characters '-' since this
#     is not a legal VHDL87 or Verilog character within an identifier.  
#     HDL net names are adjusted to contain no hyphen characters '-' but 
#     rather use underscore '_' characters.  Comment net name with the hyphen 
#     characters will remain in place since these are intended to match the 
#     schematic net names in order to better enable schematic search.
#
#     The string provided in the comment field provides the Zynq device pin 
#     mapping through the expansion connector to the carrier card net name
#     according to the following format:
#
#     "<Zynq Pin>.<SOM Net>"
# 
# ----------------------------------------------------------------------------
 
# ----------------------------------------------------------------------------
# Expansion I/O - Bank 13 
# ----------------------------------------------------------------------------   
# set_property PACKAGE_PIN V7  [get_ports {BANK13_LVDS_0_N }];  # "V7.BANK13_LVDS_0_N"
# set_property PACKAGE_PIN U7  [get_ports {BANK13_LVDS_0_P }];  # "U7.BANK13_LVDS_0_P"
# set_property PACKAGE_PIN U10 [get_ports {BANK13_LVDS_1_N }];  # "U10.BANK13_LVDS_1_N"
# set_property PACKAGE_PIN T9  [get_ports {BANK13_LVDS_1_P }];  # "T9.BANK13_LVDS_1_P"
# set_property PACKAGE_PIN U8  [get_ports {BANK13_LVDS_10_N}];  # "U8.BANK13_LVDS_10_N"
# set_property PACKAGE_PIN U9  [get_ports {BANK13_LVDS_10_P}];  # "U9.BANK13_LVDS_10_P"
# set_property PACKAGE_PIN Y11 [get_ports {BANK13_LVDS_11_N}];  # "Y11.BANK13_LVDS_11_N"
# set_property PACKAGE_PIN W11 [get_ports {BANK13_LVDS_11_P}];  # "W11.BANK13_LVDS_11_P"
# set_property PACKAGE_PIN W8  [get_ports {BANK13_LVDS_2_N }];  # "W8.BANK13_LVDS_2_N"
# set_property PACKAGE_PIN V8  [get_ports {BANK13_LVDS_2_P }];  # "V8.BANK13_LVDS_2_P"
# set_property PACKAGE_PIN U5  [get_ports {BANK13_LVDS_3_N }];  # "U5.BANK13_LVDS_3_N"
# set_property PACKAGE_PIN T5  [get_ports {BANK13_LVDS_3_P }];  # "T5.BANK13_LVDS_3_P"
# set_property PACKAGE_PIN Y13 [get_ports {BANK13_LVDS_4_N }];  # "Y13.BANK13_LVDS_4_N"
# set_property PACKAGE_PIN Y12 [get_ports {BANK13_LVDS_4_P }];  # "Y12.BANK13_LVDS_4_P"
# set_property PACKAGE_PIN V10 [get_ports {BANK13_LVDS_5_N }];  # "V10.BANK13_LVDS_5_N"
# set_property PACKAGE_PIN V11 [get_ports {BANK13_LVDS_5_P }];  # "V11.BANK13_LVDS_5_P"
# set_property PACKAGE_PIN W6  [get_ports {BANK13_LVDS_6_N }];  # "W6.BANK13_LVDS_6_N"
# set_property PACKAGE_PIN V6  [get_ports {BANK13_LVDS_6_P }];  # "V6.BANK13_LVDS_6_P"
# set_property PACKAGE_PIN Y6  [get_ports {BANK13_LVDS_7_N }];  # "Y6.BANK13_LVDS_7_N"
# set_property PACKAGE_PIN Y7  [get_ports {BANK13_LVDS_7_P }];  # "Y7.BANK13_LVDS_7_P"
# set_property PACKAGE_PIN Y8  [get_ports {BANK13_LVDS_8_N }];  # "Y8.BANK13_LVDS_8_N"
# set_property PACKAGE_PIN Y9  [get_ports {BANK13_LVDS_8_P }];  # "Y9.BANK13_LVDS_8_P"
# set_property PACKAGE_PIN W9  [get_ports {BANK13_LVDS_9_N }];  # "W9.BANK13_LVDS_9_N"
# set_property PACKAGE_PIN W10 [get_ports {BANK13_LVDS_9_P }];  # "W10.BANK13_LVDS_9_P"
# set_property PACKAGE_PIN V5  [get_ports {BANK13_SE_0     }];  # "V5.BANK13_SE_0"


# ----------------------------------------------------------------------------
# Expansion Connector JX1 - Bank 34 -
# ---------------------------------------------------------------------------- 

# set_property PACKAGE_PIN T10 [get_ports {JX1_LVDS_0_N    }];  # "T10.JX1_LVDS_0_N"
# set_property PACKAGE_PIN T11 [get_ports {JX1_LVDS_0_P    }];  # "T11.JX1_LVDS_0_P"
# set_property PACKAGE_PIN U12 [get_ports {JX1_LVDS_1_N    }];  # "U12.JX1_LVDS_1_N"
# set_property PACKAGE_PIN T12 [get_ports {JX1_LVDS_1_P    }];  # "T12.JX1_LVDS_1_P"
# set_property PACKAGE_PIN U15 [get_ports {JX1_LVDS_10_N   }];  # "U15.JX1_LVDS_10_N"
# set_property PACKAGE_PIN U14 [get_ports {JX1_LVDS_10_P   }];  # "U14.JX1_LVDS_10_P"
# set_property PACKAGE_PIN U19 [get_ports {JX1_LVDS_11_N   }];  # "U19.JX1_LVDS_11_N"
# set_property PACKAGE_PIN U18 [get_ports {JX1_LVDS_11_P   }];  # "U18.JX1_LVDS_11_P"
# set_property PACKAGE_PIN P19 [get_ports {JX1_LVDS_12_N   }];  # "P19.JX1_LVDS_12_N"
# set_property PACKAGE_PIN N18 [get_ports {JX1_LVDS_12_P   }];  # "N18.JX1_LVDS_12_P"
# set_property PACKAGE_PIN P20 [get_ports {JX1_LVDS_13_N   }];  # "P20.JX1_LVDS_13_N"
# set_property PACKAGE_PIN N20 [get_ports {JX1_LVDS_13_P   }];  # "N20.JX1_LVDS_13_P"
# set_property PACKAGE_PIN U20 [get_ports {JX1_LVDS_14_N   }];  # "U20.JX1_LVDS_14_N"
# set_property PACKAGE_PIN T20 [get_ports {JX1_LVDS_14_P   }];  # "T20.JX1_LVDS_14_P"
# set_property PACKAGE_PIN W20 [get_ports {JX1_LVDS_15_N   }];  # "W20.JX1_LVDS_15_N"
# set_property PACKAGE_PIN V20 [get_ports {JX1_LVDS_15_P   }];  # "V20.JX1_LVDS_15_P"
# set_property PACKAGE_PIN Y19 [get_ports {JX1_LVDS_16_N   }];  # "Y19.JX1_LVDS_16_N"
# set_property PACKAGE_PIN Y18 [get_ports {JX1_LVDS_16_P   }];  # "Y18.JX1_LVDS_16_P"
# set_property PACKAGE_PIN W16 [get_ports {JX1_LVDS_17_N   }];  # "W16.JX1_LVDS_17_N"
# set_property PACKAGE_PIN V16 [get_ports {JX1_LVDS_17_P   }];  # "V16.JX1_LVDS_17_P"
# set_property PACKAGE_PIN R17 [get_ports {JX1_LVDS_18_N   }];  # "R17.JX1_LVDS_18_N"
# set_property PACKAGE_PIN R16 [get_ports {JX1_LVDS_18_P   }];  # "R16.JX1_LVDS_18_P"
# set_property PACKAGE_PIN R18 [get_ports {JX1_LVDS_19_N   }];  # "R18.JX1_LVDS_19_N"
# set_property PACKAGE_PIN T17 [get_ports {JX1_LVDS_19_P   }];  # "T17.JX1_LVDS_19_P"
# set_property PACKAGE_PIN V13 [get_ports {JX1_LVDS_2_N    }];  # "V13.JX1_LVDS_2_N"
# set_property PACKAGE_PIN U13 [get_ports {JX1_LVDS_2_P    }];  # "U13.JX1_LVDS_2_P"
# set_property PACKAGE_PIN V18 [get_ports {JX1_LVDS_20_N   }];  # "V18.JX1_LVDS_20_N"
# set_property PACKAGE_PIN V17 [get_ports {JX1_LVDS_20_P   }];  # "V17.JX1_LVDS_20_P"
# set_property PACKAGE_PIN W19 [get_ports {JX1_LVDS_21_N   }];  # "W19.JX1_LVDS_21_N"
# set_property PACKAGE_PIN W18 [get_ports {JX1_LVDS_21_P   }];  # "W18.JX1_LVDS_21_P"
# set_property PACKAGE_PIN P18 [get_ports {JX1_LVDS_22_N   }];  # "P18.JX1_LVDS_22_N"
# set_property PACKAGE_PIN N17 [get_ports {JX1_LVDS_22_P   }];  # "N17.JX1_LVDS_22_P"
# set_property PACKAGE_PIN P16 [get_ports {JX1_LVDS_23_N   }];  # "P16.JX1_LVDS_23_N"
# set_property PACKAGE_PIN P15 [get_ports {JX1_LVDS_23_P   }];  # "P15.JX1_LVDS_23_P"
# set_property PACKAGE_PIN W13 [get_ports {JX1_LVDS_3_N    }];  # "W13.JX1_LVDS_3_N"
# set_property PACKAGE_PIN V12 [get_ports {JX1_LVDS_3_P    }];  # "V12.JX1_LVDS_3_P"
# set_property PACKAGE_PIN T15 [get_ports {JX1_LVDS_4_N    }];  # "T15.JX1_LVDS_4_N"
# set_property PACKAGE_PIN T14 [get_ports {JX1_LVDS_4_P    }];  # "T14.JX1_LVDS_4_P"
# set_property PACKAGE_PIN R14 [get_ports {JX1_LVDS_5_N    }];  # "R14.JX1_LVDS_5_N"
# set_property PACKAGE_PIN P14 [get_ports {JX1_LVDS_5_P    }];  # "P14.JX1_LVDS_5_P"
# set_property PACKAGE_PIN Y17 [get_ports {JX1_LVDS_6_N    }];  # "Y17.JX1_LVDS_6_N"
# set_property PACKAGE_PIN Y16 [get_ports {JX1_LVDS_6_P    }];  # "Y16.JX1_LVDS_6_P"
# set_property PACKAGE_PIN Y14 [get_ports {JX1_LVDS_7_N    }];  # "Y14.JX1_LVDS_7_N"
# set_property PACKAGE_PIN W14 [get_ports {JX1_LVDS_7_P    }];  # "W14.JX1_LVDS_7_P"
# set_property PACKAGE_PIN U17 [get_ports {JX1_LVDS_8_N    }];  # "U17.JX1_LVDS_8_N"
# set_property PACKAGE_PIN T16 [get_ports {JX1_LVDS_8_P    }];  # "T16.JX1_LVDS_8_P"
# set_property PACKAGE_PIN W15 [get_ports {JX1_LVDS_9_N    }];  # "W15.JX1_LVDS_9_N"
# set_property PACKAGE_PIN V15 [get_ports {JX1_LVDS_9_P    }];  # "V15.JX1_LVDS_9_P"
# set_property PACKAGE_PIN R19 [get_ports {JX1_SE_0        }];  # "R19.JX1_SE_0"
# set_property PACKAGE_PIN T19 [get_ports {JX1_SE_1        }];  # "T19.JX1_SE_1"


# ----------------------------------------------------------------------------
# Expansion Connector JX2 - Bank 35
# ---------------------------------------------------------------------------- 

# set_property PACKAGE_PIN B20 [get_ports {JX2_LVDS_0_N    }];  # "B20.JX2_LVDS_0_N"
# set_property PACKAGE_PIN C20 [get_ports {JX2_LVDS_0_P    }];  # "C20.JX2_LVDS_0_P"
# set_property PACKAGE_PIN A20 [get_ports {JX2_LVDS_1_N    }];  # "A20.JX2_LVDS_1_N"
# set_property PACKAGE_PIN B19 [get_ports {JX2_LVDS_1_P    }];  # "B19.JX2_LVDS_1_P"
# set_property PACKAGE_PIN L17 [get_ports {JX2_LVDS_10_N   }];  # "L17.JX2_LVDS_10_N"
# set_property PACKAGE_PIN L16 [get_ports {JX2_LVDS_10_P   }];  # "L16.JX2_LVDS_10_P"
# set_property PACKAGE_PIN K18 [get_ports {JX2_LVDS_11_N   }];  # "K18.JX2_LVDS_11_N"
# set_property PACKAGE_PIN K17 [get_ports {JX2_LVDS_11_P   }];  # "K17.JX2_LVDS_11_P"
# set_property PACKAGE_PIN H17 [get_ports {JX2_LVDS_12_N   }];  # "H17.JX2_LVDS_12_N"
# set_property PACKAGE_PIN H16 [get_ports {JX2_LVDS_12_P   }];  # "H16.JX2_LVDS_12_P"
# set_property PACKAGE_PIN H18 [get_ports {JX2_LVDS_13_N   }];  # "H18.JX2_LVDS_13_N"
# set_property PACKAGE_PIN J18 [get_ports {JX2_LVDS_13_P   }];  # "J18.JX2_LVDS_13_P"
# set_property PACKAGE_PIN G18 [get_ports {JX2_LVDS_14_N   }];  # "G18.JX2_LVDS_14_N"
# set_property PACKAGE_PIN G17 [get_ports {JX2_LVDS_14_P   }];  # "G17.JX2_LVDS_14_P"
# set_property PACKAGE_PIN F20 [get_ports {JX2_LVDS_15_N   }];  # "F20.JX2_LVDS_15_N"
# set_property PACKAGE_PIN F19 [get_ports {JX2_LVDS_15_P   }];  # "F19.JX2_LVDS_15_P"
# set_property PACKAGE_PIN G20 [get_ports {JX2_LVDS_16_N   }];  # "G20.JX2_LVDS_16_N"
# set_property PACKAGE_PIN G19 [get_ports {JX2_LVDS_16_P   }];  # "G19.JX2_LVDS_16_P"
# set_property PACKAGE_PIN H20 [get_ports {JX2_LVDS_17_N   }];  # "H20.JX2_LVDS_17_N"
# set_property PACKAGE_PIN J20 [get_ports {JX2_LVDS_17_P   }];  # "J20.JX2_LVDS_17_P"
# set_property PACKAGE_PIN J14 [get_ports {JX2_LVDS_18_N   }];  # "J14.JX2_LVDS_18_N"
# set_property PACKAGE_PIN K14 [get_ports {JX2_LVDS_18_P   }];  # "K14.JX2_LVDS_18_P"
# set_property PACKAGE_PIN G15 [get_ports {JX2_LVDS_19_N   }];  # "G15.JX2_LVDS_19_N"
# set_property PACKAGE_PIN H15 [get_ports {JX2_LVDS_19_P   }];  # "H15.JX2_LVDS_19_P"
# set_property PACKAGE_PIN D18 [get_ports {JX2_LVDS_2_N    }];  # "D18.JX2_LVDS_2_N"
# set_property PACKAGE_PIN E17 [get_ports {JX2_LVDS_2_P    }];  # "E17.JX2_LVDS_2_P"
# set_property PACKAGE_PIN N16 [get_ports {JX2_LVDS_20_N   }];  # "N16.JX2_LVDS_20_N"
# set_property PACKAGE_PIN N15 [get_ports {JX2_LVDS_20_P   }];  # "N15.JX2_LVDS_20_P"
# set_property PACKAGE_PIN L15 [get_ports {JX2_LVDS_21_N   }];  # "L15.JX2_LVDS_21_N"
# set_property PACKAGE_PIN L14 [get_ports {JX2_LVDS_21_P   }];  # "L14.JX2_LVDS_21_P"
# set_property PACKAGE_PIN M15 [get_ports {JX2_LVDS_22_N   }];  # "M15.JX2_LVDS_22_N"
# set_property PACKAGE_PIN M14 [get_ports {JX2_LVDS_22_P   }];  # "M14.JX2_LVDS_22_P"
# set_property PACKAGE_PIN J16 [get_ports {JX2_LVDS_23_N   }];  # "J16.JX2_LVDS_23_N"
# set_property PACKAGE_PIN K16 [get_ports {JX2_LVDS_23_P   }];  # "K16.JX2_LVDS_23_P"
# set_property PACKAGE_PIN D20 [get_ports {JX2_LVDS_3_N    }];  # "D20.JX2_LVDS_3_N"
# set_property PACKAGE_PIN D19 [get_ports {JX2_LVDS_3_P    }];  # "D19.JX2_LVDS_3_P"
# set_property PACKAGE_PIN E19 [get_ports {JX2_LVDS_4_N    }];  # "E19.JX2_LVDS_4_N"
# set_property PACKAGE_PIN E18 [get_ports {JX2_LVDS_4_P    }];  # "E18.JX2_LVDS_4_P"
# set_property PACKAGE_PIN F17 [get_ports {JX2_LVDS_5_N    }];  # "F17.JX2_LVDS_5_N"
# set_property PACKAGE_PIN F16 [get_ports {JX2_LVDS_5_P    }];  # "F16.JX2_LVDS_5_P"
# set_property PACKAGE_PIN L20 [get_ports {JX2_LVDS_6_N    }];  # "L20.JX2_LVDS_6_N"
# set_property PACKAGE_PIN L19 [get_ports {JX2_LVDS_6_P    }];  # "L19.JX2_LVDS_6_P"
# set_property PACKAGE_PIN M20 [get_ports {JX2_LVDS_7_N    }];  # "M20.JX2_LVDS_7_N"
# set_property PACKAGE_PIN M19 [get_ports {JX2_LVDS_7_P    }];  # "M19.JX2_LVDS_7_P"
# set_property PACKAGE_PIN M18 [get_ports {JX2_LVDS_8_N    }];  # "M18.JX2_LVDS_8_N"
# set_property PACKAGE_PIN M17 [get_ports {JX2_LVDS_8_P    }];  # "M17.JX2_LVDS_8_P"
# set_property PACKAGE_PIN J19 [get_ports {JX2_LVDS_9_N    }];  # "J19.JX2_LVDS_9_N"
# set_property PACKAGE_PIN K19 [get_ports {JX2_LVDS_9_P    }];  # "K19.JX2_LVDS_9_P"
# set_property PACKAGE_PIN G14 [get_ports {JX2_SE_0        }];  # "G14.JX2_SE_0"
# set_property PACKAGE_PIN J15 [get_ports {JX2_SE_1        }];  # "J15.JX2_SE_1"


# ----------------------------------------------------------------------------
# IOSTANDARD Constraints
#
# Note that these IOSTANDARD constraints are applied to all IOs currently
# assigned within an I/O bank.  If these IOSTANDARD constraints are 
# evaluated prior to other PACKAGE_PIN constraints being applied, then 
# the IOSTANDARD specified will likely not be applied properly to those 
# pins.  Therefore, bank wide IOSTANDARD constraints should be placed 
# within the XDC file in a location that is evaluated AFTER all 
# PACKAGE_PIN constraints within the target bank have been evaluated.
#
# Un-comment one or more of the following IOSTANDARD constraints according to
# the bank pin assignments that are required within a design.
# ---------------------------------------------------------------------------- 

# Set the bank voltage for IO Bank 34 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];

# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];

# Set the bank voltage for IO Bank 13 to 1.8V by default. 
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 13]];
# set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 13]];

