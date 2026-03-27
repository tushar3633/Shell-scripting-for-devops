#!/bin/bash

while read names
do
	echo "the name is $names"
done < name_file.txt
