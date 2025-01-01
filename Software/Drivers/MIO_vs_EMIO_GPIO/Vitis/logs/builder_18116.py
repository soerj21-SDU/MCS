# 2024-10-03T11:43:57.974674800
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis")

platform = client.create_platform_component(name = "platform",hw = "C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/design_1_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0")

comp = client.create_app_component(name="app",platform = "C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

platform = client.get_platform_component(name="platform")
domain = platform.get_domain(name="standalone_ps7_cortexa9_0")

status = domain.set_lib(lib_name="xilflash", path="C:/Xilinx/Vitis/2023.2/data/embeddedsw/lib/sw_services/xilflash_v4_10")

status = domain.regenerate()

status = platform.build()

comp = client.get_component(name="app")
comp.build()

comp.build()

vitis.dispose()

