# 2024-09-30T12:47:27.623358
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/Users/miwoj/Desktop/Zybo/GPIO_Interrupt/Vitis")

status = client.add_platform_repos(platform=["c:\Users\miwoj\Desktop\Zybo\GPIO_Interrupt\Vitis\platform"])

comp = client.create_app_component(name="app",platform = "c:/Users/miwoj/Desktop/Zybo/GPIO_Interrupt/Vitis/platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

platform = client.get_platform_component(name="platform")
domain = platform.get_domain(name="standalone_ps7_cortexa9_0")

status = domain.set_lib(lib_name="xilflash", path="C:/Xilinx/Vitis/2023.2/data/embeddedsw/lib/sw_services/xilflash_v4_10")

status = domain.regenerate()

status = platform.build()

comp = client.get_component(name="app")
comp.build()

status = platform.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

