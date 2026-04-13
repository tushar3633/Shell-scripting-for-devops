#!/bin/bash

for (( i=0 ; i<5 ; i++));
do
	ping -c 1 www.google.com >> redirect.log
done
