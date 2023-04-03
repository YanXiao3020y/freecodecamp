#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
  else
    ELEMENT_INFO=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
  fi
  # echo $ELEMENT_INFO

  if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
  else
    # ATOMIC_NUMBER
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    else
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
    fi

    # NAME
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      NAME=$($PSQL "SELECT name FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    else
      NAME=$($PSQL "SELECT name FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
    fi
    
    # SYMBOL
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      SYMBOL=$($PSQL "SELECT symbol FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    else
      SYMBOL=$($PSQL "SELECT symbol FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
    fi

    # TYPE
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      TYPE=$($PSQL "SELECT type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    else
      TYPE=$($PSQL "SELECT type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
    fi

    # ATOMIC_MASS
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    else
      ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
    fi

    # MELTING_POINT_CELSIUS
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      MELTING_POINT_CELSIUS=$($PSQL "SELECT melting_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    else
      MELTING_POINT_CELSIUS=$($PSQL "SELECT melting_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
    fi

    # BOILING_POINT_CELSIUS
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      BOILING_POINT_CELSIUS=$($PSQL "SELECT boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
    else
      BOILING_POINT_CELSIUS=$($PSQL "SELECT boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
    fi


    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."

  fi
fi

