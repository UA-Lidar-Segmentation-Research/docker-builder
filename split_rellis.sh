#!/bin/bash

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <input_directory> <output_directory"
  exit 1
fi

input_directory="$1"
output_directory="$2"

# Check if the input directory exists
if [ ! -d "$input_directory" ]; then
  echo "Error: Input directory '$input_directory' not found."
  exit 1
fi

# Check if the output directory exists, and create it if it doesn't
if [ ! -d "$output_directory" ]; then
  mkdir -p "$output_directory"
fi

move_scan_sequence(){
  local input_sequence="$1"
  local output_sequence="$2"

  target_directory=$output_directory/dataset/sequences/"$output_sequence"
  mkdir -p "$target_directory"/velodyne
  mkdir -p "$target_directory"/labels
  for scan in $(seq -w $3 $4); do
    mv "$input_directory"/dataset/sequences/"$input_sequence"/velodyne/"$scan".bin "$target_directory"/velodyne/
    mv "$input_directory"/dataset/sequences/"$input_sequence"/labels/"$scan".label "$target_directory"/labels/
  done
  cp "$input_directory"/dataset/sequences/"$input_sequence"/calib.txt "$target_directory"
  cp "$input_directory"/dataset/sequences/"$input_sequence"/times.txt "$target_directory"
  if [ "$3" -eq "0" ]; then
    start=$3
    end=$4+1
  else
    start=$3
    end=$4
  fi
  awk 'NR>='$start' && NR<='$end "$input_directory"/dataset/sequences/"$input_sequence"/poses.txt > "$target_directory"/poses.txt
#  cp "$input_directory"/dataset/sequences/"$input_sequence"/calib.txt "$target_directory"
}

# move sequence 00 training scans
move_scan_sequence 00 10 000307 001705

# move sequence 00 validation scans
move_scan_sequence 00 20 001706 002846

# move sequence 00 testing scans
move_scan_sequence 00 30 000000 000306

# move sequence 01 validation scans
move_scan_sequence 01 21 001047 002318

# move sequence 01 testing scans
move_scan_sequence 01 31 000000 001046

# move sequence 02 training scans
move_scan_sequence 02 12 000000 002157

# move sequence 02 testing scans
move_scan_sequence 02 32 002158 004146

# move sequence 03 training scans
move_scan_sequence 03 13 000000 002183

# move sequence 04 training scans
move_scan_sequence 04 14 000000 002058
