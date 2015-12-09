#!/bin/bash


if [ $# -ne 5 ]; then
	echo "Usage: bash ./ONS_Client_Test.sh [initial num] [iteration num] [increase amount] [timeout] [target address]"
	echo "Example :  bash ./ONS_Client_Test.sh 1000 5 1000 1000 8.8.8.8" 
	exit 1
fi

echo "Testing start.."
echo "Initial number of queries : $1, Iteration number : $2 ms, Increase amount: $3"
echo "Timeout : $4, Target address : $5"

for (( c=0; c<$2; c++ ))
do
	echo "node ONS_Client.js -n $(($1+$3*$c)) -t $4 -a $5"
	node ONS_Client.js -n $(($1+$3*$c)) -t $4 -a $5
		
done
