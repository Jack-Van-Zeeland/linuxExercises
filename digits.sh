#!/bin/bash

echo "Method 1"
sum=0

for nums in {1000..2000}; do
    testing=$(echo $nums)
    pattern="1000|1001|1010|1011|1100|1101|1110|1111"
    if [[ $testing =~ $pattern ]]; then
	sum=$(($sum + $nums))
    fi
done

echo $sum

echo "Method 2"
sum=0

for nums in {1000..2000}; do
    if [[ $nums =~ ^[01]+$ ]]; then
        sum=$((sum + nums))
    fi
done

echo $sum
