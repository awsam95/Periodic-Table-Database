#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

SYMBOL=$1

if [[ -z $1 ]]
then
  # if the input is not there 
  echo Please provide an element as an argument.

else 
  # if input is not a numper
  if [[ ! $SYMBOL =~ ^[0-9]+$ ]]
  then
    # if input if greater than two intigers
    LENGTH=$(echo -n $SYMBOL | wc -m)
    if [[ $LENGTH -gt 2 ]]
    then
      # get data by full name
      DATA=$($PSQL "SELECT * FROM elements WHERE name='$SYMBOL'")
      # if there is no data
      if [[ -z $DATA ]]
      then
        echo I could not find that element in the database.

      else
        echo $DATA 
      fi

    else
      # get data by atomic_symbol
      DATA=$($PSQL "SELECT * FROM elements WHERE symbol='$SYMBOL'")
      # if there is no data
      if [[ -z $DATA ]]
      then
        echo I could not find that element in the database.

      else
        echo $DATA 
      fi

    fi
  else
    # get data by atomic_number
    DATA=$($PSQL "SELECT * FROM elements WHERE atomic_number=$SYMBOL")
    # if there is no data
    if [[ -z $DATA ]]
    then
      echo I could not find that element in the database.

    else
      echo $DATA 
    fi
  fi
fi