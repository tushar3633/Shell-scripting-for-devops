#!/bin/bash
file_name="/home/tushar/Shell-scripting-for-devops/day02/name_file.txt"

for i in $(cat $file_name)
do
	echo "Your name is $i"
done

