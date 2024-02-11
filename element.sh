#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

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
      DATA=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$SYMBOL'")
      
      echo "$DATA" | while read BAR BAR NUMBER BAR SYMBOL BAR NAME BAR WEIGHT BAR MELTING BAR BOILING BAR TYPE
      do 
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $WEIGHT amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."

      done

      # if there is no data
      if [[ -z $DATA ]]
      then
        echo I could not find that element in the database.

      else
        echo $DATA 
      fi

    else
      # get data by atomic_symbol
      DATA=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$SYMBOL'")
      echo "$DATA" | while read BAR BAR NUMBER BAR SYMBOL BAR NAME BAR WEIGHT BAR MELTING BAR BOILING BAR TYPE
      do 
        echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $WEIGHT amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."

      done
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
    DATA=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number='$SYMBOL'")
    echo "$DATA" | while read BAR BAR NUMBER BAR SYMBOL BAR NAME BAR WEIGHT BAR MELTING BAR BOILING BAR TYPE
    do 
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $WEIGHT amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."

    done
    # if there is no data
    if [[ -z $DATA ]]
    then
      echo I could not find that element in the database.

    else
      echo $DATA 
    fi
  fi
fi