#!/bin/bash

admin="Tikiti_Maji"

read -p "Enter your username?" username

# check if the username provided is the admin

if [[ "${username}" == "${admin}" ]] ; then
	echo "You are the admin user!"
else
	echo "You are NOT the admin user!"
fi

# in this example its about printing the first echo is the username is equal to the admin symbolized by this "==" or "is equal"

