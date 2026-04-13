#!/bin/bash

free_space=$(free -mt | grep "Total" | awk '{print $4}')
threshold=500

while true
do
	if [[ free_space -lt $threshold ]]
	then
		echo "$(date) Warning, RAM is running low" >> ramlog.txt
	else
		echo "$(date) Sufficient RAM is available" >> ramlog.txt
	fi

	sleep 5s
done

