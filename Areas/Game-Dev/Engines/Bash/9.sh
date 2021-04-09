#!/bin/bash

# In this exercise we play with arrays,unlike variables, they can store more values

my_array=("value 1" "value 2" "value 3" "value 4")

# To access elements in an array you need to reference it by its numeric index

echo ${my_array[1]}

# this will input value 2 because numeric index starts from 0, thats not always the case with other languages, but it is for bash.

echo ${my_array[-1]}

# This will input the last element. Think of it as an inverse/reverse numeric index


