#!/bin/bash
echo "1 for if
2 for elseif
3 for else "
read NUM
if [ $NUM -eq 1 ]; then
	echo "First case"
elif [ $NUM -eq 2 ]; then
	echo "Else if"
else 
	echo "Else"
fi
