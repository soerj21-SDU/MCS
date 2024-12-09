from main_TP0 import extract_TP0_voltage, extract_elapsed_time, create_linspace, extract_TP0_sensor
from main_TP1 import extract_TP1_voltage, extract_elapsed_time, create_linspace, extract_TP1_sensor
from read_csv import read_csv, csv_scaler, compare_datasets

import matplotlib.pyplot as plt
import os

# txt file paths for torque sensors
torque_txt_file_path = os.path.join(os.path.dirname(__file__), 'TP_V1.txt')

# Extracting data from the txt files for both torque sensors
torque0_time = extract_elapsed_time(torque_txt_file_path)
print("torque0 time: " + str(len(torque0_time)))

torque0_voltage = extract_TP0_voltage(torque_txt_file_path)
print("torque0 voltage: " + str(len(torque0_voltage)))

torque0_time = create_linspace(torque0_time, torque0_voltage)
print("New torque0 time: " + str(len(torque0_time)))

torque1_time = extract_elapsed_time(torque_txt_file_path)
print("torque1 time: " + str(len(torque1_time)))

torque1_voltage = extract_TP1_voltage(torque_txt_file_path)
print("torque1 voltage: " + str(len(torque1_voltage)))

torque1_time = create_linspace(torque1_time, torque1_voltage)
print("New torque1 time: " + str(len(torque1_time)))

# csv file paths for torque sensors
torque_csv_file_path = 'C:\\Git\\GitHub\\MCS\\MC\\MC_state_machine_xADC\\Python\\datasorter\\LAB 03-12-24\\TP_V1.csv'

time = 'x-axis'
TP0_y = 'TP0'
TP1_y = 'TP1'

# Reading and scaling data from the csv files for both torque sensors
torque0_x, torque0_y = read_csv(torque_csv_file_path, time, TP0_y)
torque0_x, torque0_y = csv_scaler(torque0_x, torque0_y, torque0_time)

torque1_x, torque1_y = read_csv(torque_csv_file_path, time, TP1_y)
torque1_x, torque1_y = csv_scaler(torque1_x, torque1_y, torque1_time)

# Adjusting the x values
adder_TB0_x = +1.93 + 10
adder_TB1_x = -1.68 + 10
for i in range(len(torque0_x)):
    torque0_x[i] = torque0_x[i] + adder_TB0_x
for i in range(len(torque1_x)):
    torque1_x[i] = torque1_x[i] + adder_TB1_x

# Adjusting the y values
adder_TB0_y = + 1.68
adder_TB1_y = -1.68
for i in range(len(torque0_y)):
    torque0_y[i] = torque0_y[i] + adder_TB0_y
for i in range(len(torque1_y)):
    torque1_y[i] = torque1_y[i] + adder_TB1_y

# Comparing datasets
differences0, common_x0 = compare_datasets(torque0_x, torque0_y, torque0_time, torque0_voltage)
differences1, common_x1 = compare_datasets(torque1_x, torque1_y, torque1_time, torque1_voltage)

# Plotting the original datasets and differences for TP0
fig_tp0, (ax_tp0_1, ax_tp0_2) = plt.subplots(2, 1)

# Upper graph: Original datasets for TP0
ax_tp0_1.plot(torque0_x, torque0_y, marker='o', linestyle='-', label='TP0 Sensor Voltage scope')
ax_tp0_1.plot(torque0_time, torque0_voltage, marker='o', linestyle='-', label='TP0 Sensor Voltage ADC')
ax_tp0_1.set_title('TP0 Sensor Voltage over Time scope vs ADC')
ax_tp0_1.set_xlabel('Elapsed Time [seconds]')
ax_tp0_1.set_ylabel('TP0 Sensor Voltage [V]')
ax_tp0_1.set_xlim([12, 22])
ax_tp0_1.legend()
ax_tp0_1.grid(True)

# Lower graph: Differences for TP0
ax_tp0_2.plot(common_x0, differences0, marker='o', linestyle='-', label='Differences TP0')
ax_tp0_2.set_title('Differences Between TP0 Datasets')
ax_tp0_2.set_xlabel('Elapsed Time [seconds]')
ax_tp0_2.set_ylabel('Voltage Difference [V]')
# ax_tp0_2.set_xlim([0, 10])
# ax_tp0_2.set_ylim([-.5, .5])
ax_tp0_2.legend()
ax_tp0_2.grid(True)

plt.tight_layout()
# plt.show(block=False)
plt.show()


# # Plotting the original datasets and differences for TP1
# fig_tp1, (ax_tp1_1, ax_tp1_2) = plt.subplots(2, 1)

# # Upper graph: Original datasets for TP1
# ax_tp1_1.plot(torque1_x, torque1_y, marker='o', linestyle='-', label='TP1 Sensor Voltage scope')
# ax_tp1_1.plot(torque1_time, torque1_voltage, marker='o', linestyle='-', label='TP1 Sensor Voltage ADC')
# ax_tp1_1.set_title('TP1 Sensor Voltage over Time scope vs ADC')
# ax_tp1_1.set_xlabel('Elapsed Time [seconds]')
# ax_tp1_1.set_ylabel('TP1 Sensor Voltage [V]')
# ax_tp1_1.set_xlim([0, 10])
# ax_tp1_1.legend()
# ax_tp1_1.grid(True)

# # Lower graph: Differences for TP1
# ax_tp1_2.plot(common_x1, differences1, marker='o', linestyle='-', label='Differences TP1')
# ax_tp1_2.set_title('Differences Between TP1 Datasets')
# ax_tp1_2.set_xlabel('Elapsed Time [seconds]')
# ax_tp1_2.set_ylabel('Voltage Difference [V]')
# ax_tp1_2.set_xlim([0, 10])
# ax_tp1_2.set_ylim([-.5, .5])
# ax_tp1_2.legend()
# ax_tp1_2.grid(True)

# plt.tight_layout()
# plt.show()

TP0_value = extract_TP0_sensor(torque_txt_file_path)


plt.plot(TP0_value)
plt.xlabel('Index')
plt.ylabel('Sensor Value')
plt.title('Sensor Values Over Time TP0')
plt.show()

max_value = max(TP0_value)
min_value = min(TP0_value)

print(f"Maximum value: {max_value}")
print(f"Minimum value: {min_value}")



TP1_value = extract_TP1_sensor(torque_txt_file_path)
plt.plot(TP1_value)
plt.xlabel('Index')
plt.ylabel('Sensor Value')
plt.title('Sensor Values Over Time TP1')
plt.show()

max_value = max(TP1_value)
min_value = min(TP1_value)

print(f"Maximum value: {max_value}")
print(f"Minimum value: {min_value}")

