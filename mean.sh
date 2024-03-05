#!/bin/bash



# Function to print the usage statement
print_usage() {
    echo "Usage: $0 <column> [file.csv]"
    echo "       ./mean.sh <column> [file.csv]"
    echo "  <column> : Column number (1-indexed) to calculate mean"
    echo "  [file.csv]: Optional CSV file with header"
}

# Check for correct number of arguments
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    print_usage >&2
    exit 1
fi

# Get column number and file name
###First argument passed to the script to the variable
column="$1"
###Second argument passed to the script sent to the variable file
file="${2:-/dev/stdin}"
#If no second argument is provided, it assigns /dev/stdin (standard input) to file.
#This means that if no file is specified as an argument, the script will read from standard input.


# Check if file exists
if [ "$file" != "/dev/stdin" ]; then
    if [ ! -f "$file" ]; then
        echo "Error: File '$file' not found." 1>&2
        exit 1

    fi
fi
#Checks if the value of the file variable exists and is a regular file.
#If the file does not exist or is not a regular file, it prints an error message to standard error (>&2) and exits with a non-zero status code (exit 1).


# Extract the specified column, skip header, and calculate mean
mean=$(cut -d ',' -f "$column" "$file" | tail -n +2 | awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }')


    ## First third uses cut to extract the specified column from the file. -d ',' option specifies the delim as comma and the -f "$column" specifies the field to be extracted which is stored in variable column
	##Tail -n +2: removes the first line of the output from previous cut command. the -n +2 option tells tail to output lines sarting from 2nd skipping the header line assuming first line is a header.
	    ##last part calculates the mean of the values in column. it uses awk to perform the calculation
	    ##Sum += $1 ; n++ for each line of input, awk adds the value of the first field to the variable sum and increments n, which keeps track of count of vals.
	    ## END part after processing all lines of input, awk executes this block of code. checks if n is greater than 0. If it is prints mean
	    # Check if mean is calc
	    if [ -z "$mean" ]; then
		echo "Error: Failed to calculate mean. Invalid column number or empty file." >&2
		exit 1
	    fi

	    # Print mean
	    echo "$mean"




