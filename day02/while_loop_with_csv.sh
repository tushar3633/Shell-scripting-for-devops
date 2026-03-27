#!/bin/bash

while IFS="," read id name age
do
	echo "ID = $id , Name = $name , Age = $age"
done < test.csv
