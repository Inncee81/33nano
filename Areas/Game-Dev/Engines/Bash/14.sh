#!/bin/bash

# In this example we use a switch case statement, which is used to simplify complex conditionals when there are multiple different choices

case $some_variable in

	pattern_1)
		commands
		;;

	pattern_2| pattern_3)
		commands
		;;

	*)
		default commands
		;;
esac

# Honestly, i dont know what the fuck just happened, but thats the syntax or rather the example given in the book

# I just realized that this is just a structure of what a switch case would look like. 
# Multiple patterns can be divide by a pipe or this thing |
# all case statements start with a a case keyword
# on the same line as the case keyword, you need to specify a variable or an expression followed by the in keyword
# after that, you have your case patterns that need t =o have the ending parenthesis or ) to mark the end of the pattern
# all clauses have to be terminated by adding ;; at the end
# You can have a default statement by adding a * as the pattern
# to close the case statement use "esac" which is just case backwards

# I didnt make this executable because it will just bring an error, but its valuable reference


