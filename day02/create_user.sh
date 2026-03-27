#!/bin/bash

read -p "Enter the username" user_name

echo "You entered $user_name"

sudo useradd -m $user_name

echo "New user added"
