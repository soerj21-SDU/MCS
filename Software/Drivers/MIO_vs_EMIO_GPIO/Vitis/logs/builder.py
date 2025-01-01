# 2024-10-04T11:45:03.586831800
import vitis

client = vitis.create_client()
client.set_workspace(path="C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis")

comp = client.get_component(name="app")
comp.build()

vitis.dispose()

vitis.dispose()

