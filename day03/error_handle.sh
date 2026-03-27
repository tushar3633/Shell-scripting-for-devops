#!/bin/bash

create_directory() {
	mkdir $1

}

if ! create_directory tushar; then
	echo "This code is being exited because directory already exists"
	exit 1
fi

echo "This code should not work because code is interrupteod"
