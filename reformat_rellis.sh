#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <input_directory>"
  exit 1
fi

input_directory="$1"
output_dir_name="new_rellis"
output_directory="$input_directory/$output_dir_name"

# Check if the input directory exists
if [ ! -d "$input_directory" ]; then
  echo "Error: Input directory '$input_directory' not found."
  exit 1
fi

# Check if the output directory exists, and create it if it doesn't
if [ ! -d "$output_directory" ]; then
  mkdir -p "$output_directory"
fi

## Search for the specific zip files and extract them
for zip_file in "$input_directory"/{Rellis_3D_os1_cloud_node_kitti_bin.zip,Rellis_3D_os1_cloud_node_semantickitti_label_id_20210614.zip,Rellis_3D_lidar_poses_20210614.zip}; do
  echo $zip_file
  if [ -f "$zip_file" ]; then
    echo "Extracting '$zip_file' to '$output_directory'"
    unzip -q "$zip_file" -d "$output_directory"
    if [ $? -eq 0 ]; then
      echo "Successfully extracted '$zip_file' to '$output_directory'."
    else
      echo "Error: Failed to extract '$zip_file' to '$output_directory'."
    fi
  fi
done

#mkdir -p "$output_directory/dataset/sequences"
#mv $output_directory/Rellis-3D/000000/os1_cloud_node_kitti_bin "$output_directory/dataset/sequences"

# Loop through sequences 00000 through 00004 and move the directories
for sequence in {00000..00004}; do
  #Extract the last two digits of the sequence
  last_two_digits="${sequence: -2}"
  source_directory="$output_directory/Rellis-3D/$sequence/os1_cloud_node_kitti_bin"
  if [ -d "$source_directory" ]; then
    # Create the target directory based on the last two digits
    target_directory="$output_directory/dataset/sequences/$last_two_digits/velodyne"
    mkdir -p "$target_directory"

    mv "$source_directory"/* "$target_directory"
    if [ $? -eq 0 ]; then
      echo "Moved '$sequence' directory to '$target_directory'."
    else
      echo "Error: Failed to move '$sequence' directory."
    fi
  fi
  source_directory="$output_directory/Rellis-3D/$sequence/os1_cloud_node_semantickitti_label_id"
  if [ -d "$source_directory" ]; then
    # Create the target directory based on the last two digits
    target_directory="$output_directory/dataset/sequences/$last_two_digits/labels"
    mkdir -p "$target_directory"

    mv "$source_directory"/* "$target_directory"
    if [ $? -eq 0 ]; then
      echo "Moved '$sequence' directory to '$target_directory'."
    else
      echo "Error: Failed to move '$sequence' directory."
    fi
  fi
  source_directory="$output_directory/Rellis-3D/$sequence"
  if [ -d "$source_directory" ]; then
    # Create the target directory based on the last two digits
    target_directory="$output_directory/dataset/sequences/$last_two_digits/"
    mkdir -p "$target_directory"

    mv "$source_directory"/calib.txt "$source_directory"/poses.txt "$target_directory"
    if [ $? -eq 0 ]; then
      echo "Moved '$sequence' directory to '$target_directory'."
    else
      echo "Error: Failed to move '$sequence' directory."
    fi
  fi
  touch "$output_directory"/dataset/sequences/"$last_two_digits"/times.txt
done

rm -r "$output_directory"/Rellis-3D

