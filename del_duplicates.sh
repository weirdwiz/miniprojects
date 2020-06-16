#!/bin/bash

DIR=$1
FILENAMES=`find $DIR -type f`

for file1 in $FILENAMES
do
	FILENAMES=("${FILENAMES[@]/$file1}")
	for file2 in $FILENAMES
	do
		diff --brief $file1 $file2 >> /dev/null
		if [ $? -eq 0 ]
		then
			echo "Files $file1 and $file2 are duplicates"
			rm $file2
			echo "removed $file2"
			FILENAMES=("${FILENAMES[@]/$file2}")
		fi
	done
done
