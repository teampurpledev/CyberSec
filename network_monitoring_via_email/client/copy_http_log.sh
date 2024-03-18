#!/bin/bash

# Define source and destination machines
source_machine="source_hostname"
destination_machine="destination_hostname"

# Define source and destination paths
source_path="/path/to/source/log.log"
destination_path="/path/to/destination/http.log"

# Make sure you have passwordless SSH setup between the machines to enable scp to work without manual authentication.
# If passwordless SSH is not set up, you'll need to enter the password during the execution of the script.
echo "Copying $source_machine:$source_path to $destination_machine $destination_path"
scp "$source_machine:$source_path" - >> "$destination_path"

