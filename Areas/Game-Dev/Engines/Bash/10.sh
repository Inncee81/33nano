#!/bin/bash

# Bash if statement example

read -p "What is your name?" name

if [[ -z ${name} ]]
then
	echo "Please enter your name!"
fi

# This is simple bash conditional statement

# other statements: if, if-else and switch case statements

# The -z flag signifies a string expression "this is string"

# If nothing is inputed the shell will print the message is the echo


