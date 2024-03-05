#!/bin/bash

mkdir five || exit

cd "five" || exit

mkdir dir1 dir2 dir3 dir4 dir5

for dir in dir1 dir2 dir3 dir4 dir5; do
    (cd "$dir" && {
	 for i in {1..4}; do
	     for ((j=1; j<=i; j++)); do
		 echo "$i" >> "file$i"
	     done
	 done
    }) || exit
done
