#! /bin/bash

# connect to database
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

# create random number 1 - 1000
NUMBER=$(( RANDOM % 1000 + 1 ))

# enter username with maximum 22 characters
echo -e "\nEnter your username:"
read USERNAME

USERS=$($PSQL "SELECT game_id, username, games_played, best_game FROM users WHERE username='$USERNAME';")

# if username dosn't exist
if [[ -z $USERS ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  # Save username to database
  INSERT_GAME_DATA=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")

  # Get Data users
  USERS=$($PSQL "SELECT game_id, username, games_played, best_game FROM users WHERE username='$USERNAME';")
else
  # if username exist
  echo $USERS | while read GAME_ID BAR NAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo -e "\nWelcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

NUMBER_GUESS=0

GAME_MENU() {
  # Check if system call with arguments
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # increase number guess
  (( NUMBER_GUESS++ ))
  #echo $NUMBER;

  # ask input from user for number
  read INPUT_NUMBER;
  if [[ ! $INPUT_NUMBER =~ ^[0-9]+$ ]]
  then
    # if input not integer print
    GAME_MENU "That is not an integer, guess again:"
  else
    # if match print
    if [[ $INPUT_NUMBER == $NUMBER ]]
    then
      GAME_END "\nYou guessed it in $NUMBER_GUESS tries. The secret number was $NUMBER. Nice job!\n"
    elif [[ $INPUT_NUMBER > $NUMBER ]]
    then
      GAME_MENU "It's lower than that, guess again:"
    elif [[ $INPUT_NUMBER < $NUMBER ]]
    then
      GAME_MENU "It's higher than that, guess again:"
    fi
  fi
}

GAME_END() {
  # SAVE TO DATABASE
  echo $USERS | while read GAME_ID BAR NAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    if [[ $NUMBER_GUESS < $BEST_GAME ]] 
    then
      NUMBER_GUESS=$BEST_GAME
    fi
  done

  INSERT_GAME_DATA=$($PSQL "UPDATE users SET games_played = users.games_played + 1, best_game = $NUMBER_GUESS WHERE username = '$USERNAME';")

  echo -e $1 
}

GAME_MENU "Guess the secret number between 1 and 1000:"
