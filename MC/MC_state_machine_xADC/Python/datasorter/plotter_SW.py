from main_SW import extract_sw_sensor, extract_sw_voltage, extract_elapsed_time, create_linspace
from read_csv import read_csv, csv_scaler, compare_datasets

import matplotlib.pyplot as plt
import os

# txt file
txt_file_path = os.path.join(os.path.dirname(__file__), 'SW_V2.txt')

txt_time = extract_elapsed_time(txt_file_path)
print("Sensor time: " + str(len(txt_time)))

txt_sensor_voltage = extract_sw_voltage(txt_file_path)
print("Sensor voltage: " + str(len(txt_sensor_voltage)))

txt_time = create_linspace(txt_time, txt_sensor_voltage)
print("New sensor time: " + str(len(txt_time)))

# csv file
csv_file_path = 'C:\\Git\\GitHub\\MCS\\MC\\MC_state_machine_xADC\\Python\\datasorter\\LAB 03-12-24\\SW_V02.CSV'

x_column = 'time'
y_column = 'value'

x, y = read_csv(csv_file_path, x_column, y_column)

x, y = csv_scaler(x, y, txt_time)

adder = 14.07
for i in range(len(x)):
    x[i] = x[i] + adder

differences, common_x = compare_datasets(x, y, txt_time, txt_sensor_voltage)

# Plotting the original datasets and differences
fig, (ax1, ax2) = plt.subplots(2, 1)

# Upper graph: Original datasets
ax1.plot(x, y, marker='o', linestyle='-', label='SW Sensor Voltage scope')
ax1.plot(txt_time, txt_sensor_voltage, marker='o', linestyle='-', label='SW Sensor Voltage ADC')
ax1.set_title('SW Sensor Voltage over Time scope vs ADC')
ax1.set_xlabel('Elapsed Time [seconds]')
ax1.set_ylabel('SW Sensor Voltage [V]')
ax1.set_xlim([25, 45])
ax1.legend()
ax1.grid(True)

# Lower graph: Differences
ax2.plot(common_x, differences, marker='o', linestyle='-', label='Differences')
ax2.set_title('Differences Between Datasets')
ax2.set_xlabel('Elapsed Time [seconds]')
ax2.set_ylabel('Voltage Difference [V]')
ax2.set_xlim([25, 45])
ax2.set_ylim([-1, 1])
ax2.legend()
ax2.grid(True)

plt.tight_layout()
plt.show(block=False)

print(differences[61:111+1])
print("Average: " + str(sum(differences[61:111+1])/len(differences[61:111+1])))


# Sensor value
sw_value = extract_sw_sensor(txt_file_path)

# plt.figure()
# plt.plot(txt_time, sw_value)
# plt.xlabel('Time [s]')
# plt.ylabel('Sensor Value')
# plt.title('Sensor Values Over time')
# plt.grid()
# plt.show(block=False)

max_value = max(sw_value)
min_value = min(sw_value)

print(f"Maximum value: {max_value}")
print(f"Minimum value: {min_value}")



for i in range(len(sw_value)):
    sw_value[i] = (sw_value[i] - min_value) / (max_value - min_value) * (100 - (-100)) + (-100)

plt.figure()
plt.plot(txt_time, sw_value, label = "SW angle", marker='o', linestyle='-')
plt.xlabel('Time [s]')
plt.ylabel('Sensor angle [degree]')
plt.title('Sensor angles over time')
plt.xlim([25, 45])
plt.legend()
plt.grid()
plt.show()