from main_TP0 import extract_tp0_sensor, extract_tp0_voltage
from main_TP1 import extract_tp1_sensor, extract_tp1_voltage
import matplotlib.pyplot as plt
import os


# Path to the input file
file_path = os.path.join(os.path.dirname(__file__), 'data_all.txt')

# Extract TP0 and TP1 voltage values
tp0_voltage_values = extract_tp0_voltage(file_path)
tp1_voltage_values = extract_tp1_voltage(file_path)

# Extract TP0 and TP1 sensor values
tp0_sensor_values = extract_tp0_sensor(file_path)
tp1_sensor_values = extract_tp1_sensor(file_path)

# Create a figure with two subplots
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 8))

# Plotting the TP0 and TP1 sensor values as a scatter plot with lines
ax1.plot(range(len(tp0_sensor_values)), tp0_sensor_values, marker='o', linestyle='-', label='TP0 Sensor Value')
ax1.plot(range(len(tp1_sensor_values)), tp1_sensor_values, marker='x', linestyle='-', label='TP1 Sensor Value')
ax1.set_title('Scatter Plot of TP0 and TP1 Sensor Values')
ax1.set_xlabel('Index')
ax1.set_ylabel('Sensor Value')
ax1.legend()

# Plotting the TP0 and TP1 voltage values as a scatter plot with lines
ax2.plot(range(len(tp0_voltage_values)), tp0_voltage_values, marker='o', linestyle='-', label='TP0 Voltage')
ax2.plot(range(len(tp1_voltage_values)), tp1_voltage_values, marker='x', linestyle='-', label='TP1 Voltage')
ax2.set_title('Scatter Plot of TP0 and TP1 Voltage Values')
ax2.set_xlabel('Index')
ax2.set_ylabel('Voltage [V]')
ax2.legend()

# Display the plots
plt.tight_layout()
plt.show()