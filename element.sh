#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

SYMBOL=$1

if [[ -z $1 ]]
then
  #if the input is not there 
  echo Please provide an element as an argument.

else 
  echo hello
fi