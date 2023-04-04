#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# verfiy username existence
USER_INFO=$($PSQL "SELECT username, games_played, best_game FROM user_info WHERE username='$USERNAME'")

# USERNAME=$($PSQL "SELECT username FROM user_info WHERE username='$USERNAME'")
# GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_info WHERE username='$USERNAME'")
# BEST_GAME=$($PSQL "SELECT best_game FROM user_info WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "$USER_INFO" | while IFS='|' read USERNAME GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

#generate secrete_number
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
echo $SECRET_NUMBER

echo "Guess the secret number between 1 and 1000:"
read GUESS_NUMBER

# counter
declare -i number_of_guesses=1

until [[ $GUESS_NUMBER = $SECRET_NUMBER ]]
do
  #verfiy guess_number
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  fi

  # give hint
  if [[ $GUESS_NUMBER -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS_NUMBER -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  fi
  read GUESS_NUMBER

  
  (( number_of_guesses++ ))
  # echo number_of_guesses: $number_of_guesses
done

echo "You guessed it in $number_of_guesses tries. The secret number was $SECRET_NUMBER. Nice job!"

if [[ -z $USER_INFO ]]
then
  INSERT_DEFAULT_RESULT=$($PSQL "INSERT INTO user_info(username, games_played, best_game) VALUES('$USERNAME', 1, $number_of_guesses);")
  # echo $INSERT_DEFAULT_RESULT
else
  echo "$USER_INFO" | while IFS='|' read USERNAME GAMES_PLAYED BEST_GAME
  do
    # increase the counter of total game played
    (( GAMES_PLAYED++ ))

    # find the min of the number of best guesses
    if [[ $number_of_guesses -lt $BEST_GAME ]]
    then
      BEST_GAME=$number_of_guesses
    fi
    UPDATE_USER_INFO_RESULT=$($PSQL "UPDATE user_info SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")
    # echo $UPDATE_USER_INFO_RESULT
  done
fi



