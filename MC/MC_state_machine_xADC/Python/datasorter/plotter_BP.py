from main_BP0 import extract_BP0_sensor, extract_BP0_voltage
from main_BP1 import extract_BP1_sensor, extract_BP1_voltage
import matplotlib.pyplot as plt
import os


# Path to the input file
# file_path = os.path.join(os.path.dirname(__file__), 'data_all_V2.txt')
file_path = os.path.join(os.path.dirname(__file__), 'data_all_V3.txt')

# Extract BP0 and BP1 voltage values
BP0_voltage_values = extract_BP0_voltage(file_path)
BP1_voltage_values = extract_BP1_voltage(file_path)

# Extract BP0 and BP1 sensor values
BP0_sensor_values = extract_BP0_sensor(file_path)
BP1_sensor_values = extract_BP1_sensor(file_path)

# Create a figure with two subplots
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 8))

# Plotting the BP0 and BP1 sensor values as a scatter plot with lines
ax1.plot(range(len(BP0_sensor_values)), BP0_sensor_values, marker='o', linestyle='-', label='BP0 Sensor Value')
ax1.plot(range(len(BP1_sensor_values)), BP1_sensor_values, marker='x', linestyle='-', label='BP1 Sensor Value')
ax1.set_title('Scatter Plot of BP0 and BP1 Sensor Values')
ax1.set_xlabel('Index')
ax1.set_ylabel('Sensor Value')
ax1.legend()

# Plotting the BP0 and BP1 voltage values as a scatter plot with lines
ax2.plot(range(len(BP0_voltage_values)), BP0_voltage_values, marker='o', linestyle='-', label='BP0 Voltage')
ax2.plot(range(len(BP1_voltage_values)), BP1_voltage_values, marker='x', linestyle='-', label='BP1 Voltage')
ax2.set_title('Scatter Plot of BP0 and BP1 Voltage Values')
ax2.set_xlabel('Index')
ax2.set_ylabel('Voltage [V]')
ax2.legend()

# Display the plots
plt.tight_layout()
plt.show()