import re
import matplotlib.pyplot as plt
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


# Function to extract TP1 voltage values from the given data
def extract_TP1_voltage(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
    
    # Find all occurrences of "TP1 voltage: <value> V."
    tp1_voltage_values = re.findall(r'TP1 voltage: ([\d.]+) V\.', data)
    
    # Convert the extracted values to float
    tp1_voltage_values = [float(value) for value in tp1_voltage_values]
    
    return tp1_voltage_values

# Function to extract TP1 sensor values from the given data
def extract_TP1_sensor(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
    
    # Find all occurrences of "TP1 sensor value: <value>"
    tp1_sensor_values = re.findall(r'TP1 sensor value: ([\d.]+)\.', data)
    
    # Convert the extracted values to float
    tp1_sensor_values = [float(value) for value in tp1_sensor_values]
    
    return tp1_sensor_values

# if __name__ == '__main__':
    # Path to the input file
    file_path = os.path.join(os.path.dirname(__file__), 'data_all.txt')

    # Extract TP1 voltage values
    tp1_voltage_values = extract_tp1_voltage(file_path)

    # Extract TP1 sensor values
    tp1_sensor_values = extract_tp1_sensor(file_path)

    # Create a figure with two subplots
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 8))

    # Plotting the TP1 sensor values as a scatter plot with lines
    ax1.plot(range(len(tp1_sensor_values)), tp1_sensor_values, marker='o', linestyle='-')
    ax1.set_title('Scatter Plot of TP1 Sensor Values')
    ax1.set_xlabel('Index')
    ax1.set_ylabel('TP1 Sensor Value')

    # Plotting the TP1 voltage values as a scatter plot with lines
    ax2.plot(range(len(tp1_voltage_values)), tp1_voltage_values, marker='o', linestyle='-')
    ax2.set_title('Scatter Plot of TP1 Voltage Values')
    ax2.set_xlabel('Index')
    ax2.set_ylabel('TP1 Voltage [V]')

    # Display the plots
    plt.tight_layout()
    plt.show()