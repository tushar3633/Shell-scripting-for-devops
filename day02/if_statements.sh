#!/bin/bash

read -p "Kon gadha hai: " person1

if [[ $person1 == "Akshat" ]];
then
	echo "shi ho tum"
elif [[ $person1 == "Saiyam" ]];then
	echo "tum shi ho"
else
	echo "tum gadhe ho"
fi

