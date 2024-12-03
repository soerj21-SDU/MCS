import csv

from scipy.interpolate import interp1d
import numpy as np
import matplotlib.pyplot as plt

def read_csv(file_path, x_column, y_column):
    x_values = []
    y_values = []

    with open(file_path, mode='r') as file:
        csv_reader = csv.DictReader(file)
        for row in csv_reader:
            x_values.append(float(row[x_column]))
            y_values.append(float(row[y_column]))

    return x_values, y_values

def csv_scaler(x_list, y_list, time_axis):
    """
    Function to scale the x and y lists based on the time axis, rounding to one decimal and avoiding duplicates.
    
    Parameters:
    x_list (list): List of x data points.
    y_list (list): List of y data points.
    time_axis (list): List of time points to compare with.
    
    Returns:
    tuple: Scaled lists of x and y data points.
    """
    # Round the x list to one decimal
    rounded_x_list = [round(x, 1) for x in x_list]
    
    # Create a set to track added points and avoid duplicates
    added_points = set()
    
    new_x_list = []
    new_y_list = []
    
    # Iterate over the time axis
    for time_point in time_axis:
        # Round the time point to one decimal
        rounded_time_point = round(time_point, 1)
        
        # Check if the rounded time point exists in the rounded x list and is not a duplicate
        if rounded_time_point in rounded_x_list and rounded_time_point not in added_points:
            index = rounded_x_list.index(rounded_time_point)
            new_x_list.append(rounded_x_list[index])
            new_y_list.append(y_list[index])
            added_points.add(rounded_time_point)
    
    return new_x_list, new_y_list

def compare_datasets(x1, y1, x2, y2):
    """
    Function to compare two datasets by interpolating one dataset to match the timestamps of the other dataset.
    
    Parameters:
    x1 (list): List of x data points for the first dataset.
    y1 (list): List of y data points for the first dataset.
    x2 (list): List of x data points for the second dataset.
    y2 (list): List of y data points for the second dataset.
    
    Returns:
    tuple: Differences between the datasets and the common x values.
    """
    # Interpolate y1 to match x2
    interp_func = interp1d(x1, y1, kind='linear', fill_value='extrapolate')
    interpolated_y1 = interp_func(x2)
    
    # Calculate differences
    differences = np.array(y2) - interpolated_y1
    
    return differences, x2

if __name__ == '__main__':
    # Example usage
    file_path = 'C:\\Git\\GitHub\\MCS\\MC\\MC_state_machine_xADC\\Python\\datasorter\\LAB 03-12-24\\SW_V02.CSV'
    x_column = 'time'
    y_column = 'value'

    # Example usage
    x_list = [0.55, 1.05, 1.55, 2.05, 2.55, 3.05]
    y_list = [3.364, 3.365, 3.366, 3.367, 3.368, 3.369]
    time_axis = [0.5, 1.5, 2.5]

    scaled_x, scaled_y = csv_scaler(x_list, y_list, time_axis)
    print("Scaled X List:", scaled_x)
    print("Scaled Y List:", scaled_y)