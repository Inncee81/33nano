#!/bin/bash

# In exercise 14.sh we simply looked at the structure of a switch case statement. In this exercise we have an actual example

echo -n "Enter the name of a car brand: "
read car

case $car in

	Tesla)
		echo -n "${car}'s factory in the USA. "
		;;

	BMW | Mercedes | Audi |  Porsche)
		echo -n "${car}'s factory in Germany. "
		;;

	Toyota | Mazda | Mitsubishi | Subaru)
		echo -n "${car}'s factory in Japan."
		;;

	*)
		echo -n "${car} is an unknown car brand."
		;;
esac

# Basicaly if you enter a car brand thats not in the list the last portion will be echoed. I am not sure if its case sensitive, but we will..
# figure that out. Yep, it is case sensitive

