## Create file
`touch <file-name>`

## redirection for error or stderr
`bad_command 2> <file-name>`

## redirection for standard ouput or stdout
`echo "text" 1> <file-name>`

## add or replace text
`echo -e "text" > <file-name>`

## Append text to file
`echo -e "text" >> <filename>`

## Search Text in the file
`grep --color 'meow[a-z]*' <name-file>`

## Count line, words or character
`wc <name-file>`

## Search Text with line number and view only number with   sed 
`grep --line-number --color 'meow[a-z]*' <file-name> | sed -E 's/([0-9]+).*/\1/'`

## view different of two files
`diff <file-1> <file-2> --color`

