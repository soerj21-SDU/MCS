import re
import matplotlib.pyplot as plt
import os

# Function to extract SW voltage values from the given data
def extract_sw_voltage(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
    
    # Find all occurrences of "SW voltage: <value> V."
    sw_voltage_values = re.findall(r'SW voltage: ([\d.]+) V\.', data)
    
    # Convert the extracted values to float
    sw_voltage_values = [float(value) for value in sw_voltage_values]
    
    return sw_voltage_values

# Function to extract SW sensor values from the given data
def extract_sw_sensor(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
    
    # Find all occurrences of "SW sensor value: <value> V."
    sw_sensor_values = re.findall(r'SW sensor value: ([\d.]+) V\.', data)
    
    # Convert the extracted values to float
    sw_sensor_values = [float(value) for value in sw_sensor_values]
    
    return sw_sensor_values

# Path to the input file
file_path = os.path.join(os.path.dirname(__file__), 'data_SW.txt')

# Extract SW voltage values
sw_voltage_values = extract_sw_voltage(file_path)

# Extract SW sensor values
sw_sensor_values = extract_sw_sensor(file_path)

# Create a figure with two subplots
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 8))

# Plotting the SW sensor values as a scatter plot with lines
ax1.plot(range(len(sw_sensor_values)), sw_sensor_values, marker='o', linestyle='-')
ax1.set_title('Scatter Plot of SW Sensor Values')
ax1.set_xlabel('Index')
ax1.set_ylabel('SW Sensor Value')

# Plotting the SW voltage values as a scatter plot with lines
ax2.plot(range(len(sw_voltage_values)), sw_voltage_values, marker='o', linestyle='-')
ax2.set_title('Scatter Plot of SW Voltage Values')
ax2.set_xlabel('Index')
ax2.set_ylabel('SW Voltage [V]')

# Display the plots
plt.tight_layout()
plt.show()