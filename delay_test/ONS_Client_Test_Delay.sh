#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: bash ./ONS_Client_Test.sh [num] [target address]"
	echo "Example :  bash ./ONS_Client_Test.sh 10 8.8.8.8"
	exit 1
fi

rm ./result

echo "Sending $1 ONS queries..."

for (( c=1; c<=$1; c++ ))
do
	dig @$2 3.5.1.0.0.0.0.0.0.0.0.8.8.gtin.gs1.id.onsepc.kr naptr | awk -f parsing.awk >> result 
done

echo ""
echo "---Results---"

awk -v n=$1 -f average.awk result
