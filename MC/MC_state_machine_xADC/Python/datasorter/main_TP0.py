import re
import matplotlib.pyplot as plt
import os

# Function to extract TP0 voltage values from the given data
def extract_tp0_voltage(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
    
    # Find all occurrences of "TP0 voltage: <value> V."
    tp0_voltage_values = re.findall(r'TP0 voltage: ([\d.]+) V\.', data)
    
    # Convert the extracted values to float
    tp0_voltage_values = [float(value) for value in tp0_voltage_values]
    
    return tp0_voltage_values

# Function to extract TP0 sensor values from the given data
def extract_tp0_sensor(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
    
    # Find all occurrences of "TP0 sensor value: <value>"
    tp0_sensor_values = re.findall(r'TP0 sensor value: ([\d.]+)\.', data)
    
    # Convert the extracted values to float
    tp0_sensor_values = [float(value) for value in tp0_sensor_values]
    
    return tp0_sensor_values

# Absolute path to the input file
file_path = os.path.join(os.path.dirname(__file__), 'data_all.txt')

# Extract TP0 voltage values
tp0_voltage_values = extract_tp0_voltage(file_path)

# Extract TP0 sensor values
tp0_sensor_values = extract_tp0_sensor(file_path)

# Create a figure with two subplots
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 8))

# Plotting the TP0 sensor values as a scatter plot with lines
ax1.plot(range(len(tp0_sensor_values)), tp0_sensor_values, marker='o', linestyle='-')
ax1.set_title('Scatter Plot of TP0 Sensor Values')
ax1.set_xlabel('Index')
ax1.set_ylabel('TP0 Sensor Value')

# Plotting the TP0 voltage values as a scatter plot with lines
ax2.plot(range(len(tp0_voltage_values)), tp0_voltage_values, marker='o', linestyle='-')
ax2.set_title('Scatter Plot of TP0 Voltage Values')
ax2.set_xlabel('Index')
ax2.set_ylabel('TP0 Voltage [V]')

# Display the plots
plt.tight_layout()
plt.show()