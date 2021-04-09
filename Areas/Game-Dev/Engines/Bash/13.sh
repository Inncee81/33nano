#!/bin/bash

if (( $EUID == 0 )); then
	echo "Please do not run as root"
	exit
fi

# In this script the EUID is the current User ID, in my case drqueef.

# By the way, this script does nothing

