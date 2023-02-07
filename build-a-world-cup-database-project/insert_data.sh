#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Empty database
echo $($PSQL "TRUNCATE TABLE games, teams;");

# Read csv file
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # get team_id for winner team
    TEAM_WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");

    # if team_id not found
    if [[ -z $TEAM_WINNER_ID ]]
    then
      # insert data team
      echo $($PSQL "INSERT INTO teams(name) VALUES ('$WINNER');");

      # Get new team id
      TEAM_WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'");
    fi

     # get team_id for winner team
    TEAM_OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");

    # if team_id not found
    if [[ -z $TEAM_OPPONENT_ID ]]
    then
      # insert data team
      echo $($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT');");

      # Get new team id
      TEAM_OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'");
    fi

    # insert games
    echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $TEAM_WINNER_ID, $TEAM_OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);");
  fi
done