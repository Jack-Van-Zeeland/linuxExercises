#!/bin/bash
sum=0

for nums in {1000..2000}; do
    if [[ $nums =~ ^1[01]+$ ]]; then
        sum=$((sum + nums))
    fi
done

echo $sum
