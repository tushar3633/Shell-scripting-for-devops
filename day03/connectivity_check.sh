#!/bin/bash

read -p "Enter the website" site

ping -c 1 $site
#sleep 5s

if [[ $? -eq 0 ]]; then
	echo "Successfully connected to $site"
else
	echo "Unable to connect"
fi
