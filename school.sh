#!/bin/bash
cat Property_Tax_Roll.csv |
    grep .*MADISON.SCHOOLS.* |
    cut -d "," -f7 |
    {
	mysum=0
	mycount=0
	while read value; do
	    mysum=$((mysum+value))
	    mycount=$((mycount+1))
	done
	myaverage=$((mysum/mycount))
	echo "Sum: $mysum"
	echo "Average: $myaverage"
    }
