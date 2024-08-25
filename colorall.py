import os
import subprocess

def run_inference_on_folders(parent_directory):
    # Iterate through all items in the parent directory
    for item in os.listdir(parent_directory):
        item_path = os.path.join(parent_directory, item)
        # Check if the item is a folder
        if os.path.isdir(item_path):
            # Build the command to run
            command = f'python310 .\\inference.py -p "{item_path}"'
            # Print the command (optional)
            print(f'Running command: {command}')
            # Execute the command
            subprocess.run(command, shell=True)

# Specify the parent directory
parent_directory = "./figures/Vinland_Saga"

# Run the function
run_inference_on_folders(parent_directory)
