from main_TP0 import extract_TP0_voltage, extract_elapsed_time, create_linspace
from main_TP1 import extract_TP1_voltage, extract_elapsed_time, create_linspace
from read_csv import read_csv, csv_scaler, compare_datasets

import matplotlib.pyplot as plt
import os

# txt file paths for brake sensors
brake_txt_file_path = os.path.join(os.path.dirname(__file__), 'TP_V1.txt')

# Extracting data from the txt files for both brake sensors
brake0_time = extract_elapsed_time(brake_txt_file_path)
print("Brake0 time: " + str(len(brake0_time)))

brake0_voltage = extract_TP0_voltage(brake_txt_file_path)
print("Brake0 voltage: " + str(len(brake0_voltage)))

brake0_time = create_linspace(brake0_time, brake0_voltage)
print("New Brake0 time: " + str(len(brake0_time)))

brake1_time = extract_elapsed_time(brake_txt_file_path)
print("Brake1 time: " + str(len(brake1_time)))

brake1_voltage = extract_TP1_voltage(brake_txt_file_path)
print("Brake1 voltage: " + str(len(brake1_voltage)))

brake1_time = create_linspace(brake1_time, brake1_voltage)
print("New Brake1 time: " + str(len(brake1_time)))

# csv file paths for brake sensors
brake_csv_file_path = 'C:\\Git\\GitHub\\MCS\\MC\\MC_state_machine_xADC\\Python\\datasorter\\LAB 03-12-24\\TP_V1.csv'

time = 'x-axis'
TP0_y = 'TP0'
TP1_y = 'TP1'

# Reading and scaling data from the csv files for both brake sensors
brake0_x, brake0_y = read_csv(brake_csv_file_path, time, TP0_y)
brake0_x, brake0_y = csv_scaler(brake0_x, brake0_y, brake0_time)

brake1_x, brake1_y = read_csv(brake_csv_file_path, time, TP1_y)
brake1_x, brake1_y = csv_scaler(brake1_x, brake1_y, brake1_time)

# Adjusting the x values
adder_TB0_x = +1.93 + 10
adder_TB1_x = -1.68 + 10
for i in range(len(brake0_x)):
    brake0_x[i] = brake0_x[i] + adder_TB0_x
for i in range(len(brake1_x)):
    brake1_x[i] = brake1_x[i] + adder_TB1_x

# Adjusting the y values
adder_TB0_y = + 1.68
adder_TB1_y = -1.68
for i in range(len(brake0_y)):
    brake0_y[i] = brake0_y[i] + adder_TB0_y
for i in range(len(brake1_y)):
    brake1_y[i] = brake1_y[i] + adder_TB1_y

# Comparing datasets
differences0, common_x0 = compare_datasets(brake0_x, brake0_y, brake0_time, brake0_voltage)
differences1, common_x1 = compare_datasets(brake1_x, brake1_y, brake1_time, brake1_voltage)

# Plotting the original datasets and differences for TP0
fig_tp0, (ax_tp0_1, ax_tp0_2) = plt.subplots(2, 1)

# Upper graph: Original datasets for TP0
ax_tp0_1.plot(brake0_x, brake0_y, marker='o', linestyle='-', label='TP0 Sensor Voltage scope')
ax_tp0_1.plot(brake0_time, brake0_voltage, marker='o', linestyle='-', label='TP0 Sensor Voltage ADC')
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
# ax_tp1_1.plot(brake1_x, brake1_y, marker='o', linestyle='-', label='TP1 Sensor Voltage scope')
# ax_tp1_1.plot(brake1_time, brake1_voltage, marker='o', linestyle='-', label='TP1 Sensor Voltage ADC')
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