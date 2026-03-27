#!/bin/bash

start=$2
end=$3
for ((num = start ; num<=end ; num++))
do
	rmdir "$1$num"
done

