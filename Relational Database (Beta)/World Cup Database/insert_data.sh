#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\ninsert_data.sh (worldcup)\n"

# TRUNCATE TABLE games, teams;
echo $($PSQL "TRUNCATE games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT OPPONENT_GOALS WINNER_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    #get WINNER_name from teams
    NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    #if name is not found
    if [[ -z $NAME ]]
    then
      #insert WINNER_name to teams table
      INSERT_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_NAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
    fi

    #get WINNER_name from teams
    NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    #if name is not found
    if [[ -z $NAME ]]
    then
      #insert WINNER_name to teams table
      INSERT_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_NAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi

    # echo $YEAR $ROUND $WINNER_ID $OPPONENT_ID $OPPONENT_GOALS $WINNER_GOALS
  fi
done

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    #get WINNER_ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")

    #get OPPONENT_ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    
    # echo WINNER_ID: $WINNER_ID
    # echo OPPONENT_ID: $OPPONENT_ID
    #insert record to games table
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into games $YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS
    fi

  fi
done
