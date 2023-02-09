## log on to postgresql
`psql --username=freecodecamp --dbname=postgres`

## direct query using command
`psql --username=freecodecamp --dbname=salon -c "SQL QUERY HERE"`

## export database
`pg_dump -cC --inserts -U <username> <dbname> > <name>.sql`