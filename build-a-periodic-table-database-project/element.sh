#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # Convert to number if value is string
  NUMBER_VALUE_ARGUMENT=0
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    NUMBER_VALUE_ARGUMENT=$1
  fi

  # check if input exist in elements table
  ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$NUMBER_VALUE_ARGUMENT OR symbol = '$1' OR name = '$1';");

  if [[ -z $ELEMENT_RESULT ]]
  then
    # if result empty
    echo "I could not find that element in the database."
  else
    echo $ELEMENT_RESULT | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR MASS BAR MELTING BAR BOILING BAR TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
fi