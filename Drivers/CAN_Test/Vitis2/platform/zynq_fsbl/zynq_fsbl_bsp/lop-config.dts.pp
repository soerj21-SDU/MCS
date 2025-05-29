#line 2 "lop-config.dts"
/dts-v1/;
/ {
        compatible = "system-device-tree-v1,lop";
        lops {
                lop_0 {
                        compatible = "system-device-tree-v1,lop,load";
                        load = "assists/baremetal_validate_comp_xlnx.py";
                };

                lop_1 {
                    compatible = "system-device-tree-v1,lop,assist-v1";
                    node = "/";
                    outdir = "C:/B_Git/MCS/Drivers/CAN_Test/Vitis2/platform/zynq_fsbl/zynq_fsbl_bsp";
                    id = "module,baremetal_validate_comp_xlnx";
                    options = "ps7_cortexa9_0 C:/Vitis/2024.1/data/embeddedsw/lib/sw_services/xilflash_v4_11/src C:/B_Git/MCS/Drivers/CAN_Test/Vitis2/.wsdata/.repo.yaml";
                };

        };
    };
