import re
import matplotlib.pyplot as plt
import os

# Function to extract BP0 voltage values from the given data
def extract_BP0_voltage(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
    
    # Find all occurrences of "BP0 voltage: <value> V."
    bp0_voltage_values = re.findall(r'BP0 voltage: ([\d.]+) V\.', data)
    
    # Convert the extracted values to float
    bp0_voltage_values = [float(value) for value in bp0_voltage_values]
    
    return bp0_voltage_values

# Function to extract BP0 sensor values from the given data
def extract_BP0_sensor(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
    
    # Find all occurrences of "BP0 sensor value: <value>"
    bp0_sensor_values = re.findall(r'BP0 sensor value: ([\d.]+)\.', data)
    
    # Convert the extracted values to float
    bp0_sensor_values = [float(value) for value in bp0_sensor_values]
    
    return bp0_sensor_values

# Path to the input file
file_path = os.path.join(os.path.dirname(__file__), 'data_BP0.txt')

# Extract BP0 voltage values
bp0_voltage_values = extract_BP0_voltage(file_path)

# Extract BP0 sensor values
bp0_sensor_values = extract_BP0_sensor(file_path)

# Create a figure with two subplots
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 8))

# Plotting the BP0 sensor values as a scatter plot with lines
ax1.plot(range(len(bp0_sensor_values)), bp0_sensor_values, marker='o', linestyle='-')
ax1.set_title('Scatter Plot of BP0 Sensor Values')
ax1.set_xlabel('Index')
ax1.set_ylabel('BP0 Sensor Value')

# Plotting the BP0 voltage values as a scatter plot with lines
ax2.plot(range(len(bp0_voltage_values)), bp0_voltage_values, marker='o', linestyle='-')
ax2.set_title('Scatter Plot of BP0 Voltage Values')
ax2.set_xlabel('Index')
ax2.set_ylabel('BP0 Voltage [V]')

# Display the plots
plt.tight_layout()
plt.show()