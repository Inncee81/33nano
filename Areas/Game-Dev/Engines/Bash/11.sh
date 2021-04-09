#!/bin/bash

# Bash if statement example

read -p "What is you name?" name

if [[ -z ${name} ]]
then
	echo "Please enter your name!"
else 
	echo "Hi there ${name}"
fi

# fi marks the end of a statement
# In this example, if i dont enter the name.the first part will otherwise, i will be greated. 
