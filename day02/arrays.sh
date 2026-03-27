#!/bin/bash

myArray=(1 2 3.4 hello "1 2 3")

#all elements
echo "${myArray[*]}"

#index element
echo "${myArray[3]}"

#length
echo "${#myArray[*]}"

#slicing
echo "${myArray[*]:2}"

echo "${myArray[*]:1:3}"

myArray+=(56 8)
echo "${myArray[*]}"
