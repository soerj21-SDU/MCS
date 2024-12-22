from main_BP0 import extract_BP0_voltage, extract_elapsed_time, create_linspace, extract_BP0_sensor
from main_BP1 import extract_BP1_voltage, extract_elapsed_time, create_linspace, extract_BP1_sensor
from read_csv import read_csv, csv_scaler, compare_datasets

import matplotlib.pyplot as plt
import os

# txt file paths for brake sensors
brake_txt_file_path = os.path.join(os.path.dirname(__file__), 'BP_V2.txt')

# Extracting data from the txt files for both brake sensors
brake0_time = extract_elapsed_time(brake_txt_file_path)
print("Brake0 time: " + str(len(brake0_time)))

brake0_voltage = extract_BP0_voltage(brake_txt_file_path)
print("Brake0 voltage: " + str(len(brake0_voltage)))

brake0_time = create_linspace(brake0_time, brake0_voltage)
print("New Brake0 time: " + str(len(brake0_time)))

brake1_time = extract_elapsed_time(brake_txt_file_path)
print("Brake1 time: " + str(len(brake1_time)))

brake1_voltage = extract_BP1_voltage(brake_txt_file_path)
print("Brake1 voltage: " + str(len(brake1_voltage)))

brake1_time = create_linspace(brake1_time, brake1_voltage)
print("New Brake1 time: " + str(len(brake1_time)))

# csv file paths for brake sensors
brake_csv_file_path_C1 = 'C:\Git\GitHub\MCS\MC\MC_state_machine_xADC\Python\datasorter\LAB 16-12-24\BP_V21.CSV'
brake_csv_file_path_C2 = 'C:\Git\GitHub\MCS\MC\MC_state_machine_xADC\Python\datasorter\LAB 16-12-24\BP_V22.CSV'

time = 'time'
BP0_y = 'C1'
BP1_y = 'C2'

# Reading and scaling data from the csv files for both brake sensors
brake0_x, brake0_y = read_csv(brake_csv_file_path_C1, time, BP0_y)
# brake0_x, brake0_y = csv_scaler(brake0_x, brake0_y, brake0_time)

brake1_x, brake1_y = read_csv(brake_csv_file_path_C2, time, BP1_y)
# brake1_x, brake1_y = csv_scaler(brake1_x, brake1_y, brake1_time)

# Adjusting the x values
brake0_x_adder = 1.5+(25.61-13.27)+0.20
brake1_x_adder = 0
for i in range(len(brake0_x)):
    brake0_x[i] = brake0_x[i] + brake0_x_adder
for i in range(len(brake1_x)):
    brake1_x[i] = brake1_x[i] + brake1_x_adder

# Comparing datasets
differences0, common_x0 = compare_datasets(brake0_x, brake0_y, brake0_time, brake0_voltage)
differences1, common_x1 = compare_datasets(brake1_x, brake1_y, brake1_time, brake1_voltage)

# plotting voltages together
plt.plot(brake0_time, brake0_voltage, marker='o', linestyle='-', label='BP0 Sensor Voltage ADC')
plt.plot(brake1_time, brake1_voltage, marker='o', linestyle='-', label='BP1 Sensor Voltage ADC')
plt.tight_layout()
plt.grid()
plt.title('BP0 Sensor Voltage over Time scope vs ADC')
plt.xlabel('Elapsed Time [seconds]')
plt.ylabel('BP0 Sensor Voltage [V]')
plt.xlim([10, 16])
plt.legend()
plt.show(block=False)



# Plotting the original datasets and differences for BP0
fig_bp0, (ax_bp0_1, ax_bp0_2) = plt.subplots(2, 1)

# Upper graph: Original datasets for BP0
ax_bp0_1.plot(brake0_x, brake0_y, marker='o', linestyle='-', label='BP0 Sensor Voltage scope')
ax_bp0_1.plot(brake0_time, brake0_voltage, marker='o', linestyle='-', label='BP0 Sensor Voltage ADC')
ax_bp0_1.set_title('BP0 Sensor Voltage over Time scope vs ADC')
ax_bp0_1.set_xlabel('Elapsed Time [seconds]')
ax_bp0_1.set_ylabel('BP0 Sensor Voltage [V]')
ax_bp0_1.set_xlim([12, 16])
ax_bp0_1.legend()
ax_bp0_1.grid(True)

# Lower graph: Differences for BP0
ax_bp0_2.plot(common_x0, differences0, marker='o', linestyle='-', label='Differences BP0')
ax_bp0_2.set_title('Differences Between BP0 Datasets')
ax_bp0_2.set_xlabel('Elapsed Time [seconds]')
ax_bp0_2.set_ylabel('Voltage Difference [V]')
ax_bp0_2.set_xlim([12, 16])
ax_bp0_2.set_ylim([-.2, .2])
ax_bp0_2.legend()
ax_bp0_2.grid(True)

print(differences0[29:38+1])
print("Average: " + str(sum(differences0[29:38+1])/len(differences0[29:38+1])))


plt.tight_layout()
plt.show(block=False)

# Plotting the original datasets and differences for BP1
fig_bp1, (ax_bp1_1, ax_bp1_2) = plt.subplots(2, 1)

# Upper graph: Original datasets for BP1
ax_bp1_1.plot(brake1_x, brake1_y, marker='o', linestyle='-', label='BP1 Sensor Voltage scope')
ax_bp1_1.plot(brake1_time, brake1_voltage, marker='o', linestyle='-', label='BP1 Sensor Voltage ADC')
ax_bp1_1.set_title('BP1 Sensor Voltage over Time scope vs ADC')
ax_bp1_1.set_xlabel('Elapsed Time [seconds]')
ax_bp1_1.set_ylabel('BP1 Sensor Voltage [V]')
# ax_bp1_1.set_xlim([0, 10])
ax_bp1_1.legend()
ax_bp1_1.grid(True)

# Lower graph: Differences for BP1
ax_bp1_2.plot(common_x1, differences1, marker='o', linestyle='-', label='Differences BP1')
ax_bp1_2.set_title('Differences Between BP1 Datasets')
ax_bp1_2.set_xlabel('Elapsed Time [seconds]')
ax_bp1_2.set_ylabel('Voltage Difference [V]')
# ax_bp1_2.set_xlim([0, 10])
# ax_bp1_2.set_ylim([-.5, .5])
ax_bp1_2.legend()
ax_bp1_2.grid(True)

plt.tight_layout()
plt.show()


# BP0_value = extract_BP0_sensor(brake_txt_file_path)


# plt.plot(BP0_value)
# plt.xlabel('Index')
# plt.ylabel('Sensor Value')
# plt.title('Sensor Values Over Time BP0')
# plt.show()

# max_value = max(BP0_value)
# min_value = min(BP0_value)

# print(f"Maximum value: {max_value}")
# print(f"Minimum value: {min_value}")

# BP1_value = extract_BP1_sensor(brake_txt_file_path)
# plt.plot(BP1_value)
# plt.xlabel('Index')
# plt.ylabel('Sensor Value')
# plt.title('Sensor Values Over Time BP1')
# plt.show()

# max_value = max(BP1_value)
# min_value = min(BP1_value)

# print(f"Maximum value: {max_value}")
# print(f"Minimum value: {min_value}")

