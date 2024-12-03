import re
# import matplotlib.pyplot as plt
import os


def create_linspace(time_list, values_list):
    start_time = time_list[0]
    end_time = time_list[-1]
    
    # Calculate the step size
    step_size = (end_time - start_time) / (len(values_list) - 1)
    
    # Create the new time list
    new_time_list = [start_time + i * step_size for i in range(len(values_list))]
    
    return new_time_list

# Function to extract elapsed time values from the given data
def extract_elapsed_time(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
    
    # Find all occurrences of "Elapsed time: <value> seconds"
    elapsed_time_values = re.findall(r'Elapsed time: ([\d.]+) seconds', data)
    
    # Convert the extracted values to float
    elapsed_time_values = [float(value) for value in elapsed_time_values]
    
    return elapsed_time_values

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
    
    # Find all occurrences of "SW sensor value: <value>"
    sw_sensor_values = re.findall(r'SW sensor value: ([\d.]+)\.', data)
    
    # Convert the extracted values to float
    sw_sensor_values = [float(value) for value in sw_sensor_values]
    
    return sw_sensor_values

# if __name__ == '__main__':

    # Path to the input file
    file_path = os.path.join(os.path.dirname(__file__), 'SW_V2.txt')

    # Extract elapsed time values
    elapsed_time_values = extract_elapsed_time(file_path)

    # Extract SW voltage values
    sw_voltage_values = extract_sw_voltage(file_path)

    # Extract SW sensor values
    sw_sensor_values = extract_sw_sensor(file_path)

    # Ensure all lists are the same length by truncating to the shortest list length
    min_length = min(len(elapsed_time_values), len(sw_voltage_values), len(sw_sensor_values))
    elapsed_time_values = elapsed_time_values[:min_length]
    sw_voltage_values = sw_voltage_values[:min_length]
    sw_sensor_values = sw_sensor_values[:min_length]

    # Create a figure with three subplots
    fig, (ax1, ax2) = plt.subplots(2, 1)

    # Plotting the SW sensor values as a scatter plot with lines
    ax1.plot(elapsed_time_values, sw_sensor_values, marker='o', linestyle='-')
    ax1.set_title('Scatter Plot of SW Sensor Values')
    ax1.set_xlabel('Time [s]')
    ax1.set_ylabel('SW Sensor Value')

    # Plotting the SW voltage values as a scatter plot with lines
    ax2.plot(elapsed_time_values, sw_voltage_values, marker='o', linestyle='-')
    ax2.set_title('Scatter Plot of SW Voltage Values')
    ax2.set_xlabel('Time [s]')
    ax2.set_ylabel('SW Voltage [V]')

    # Display the plots
    plt.tight_layout()
    plt.show()