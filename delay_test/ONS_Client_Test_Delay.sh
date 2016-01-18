#!/bin/bash

if [ $# -ne 4 ]; then
	echo "Usage: bash ./ONS_Client_Test.sh [initial num] [num of iteration] [increasing amount] [target address]"
	echo "Example :  bash ./ONS_Client_Test.sh 10 10 10 8.8.8.8"
	exit 1
fi

for (( i=1; i<=$2; i++ )) 
do
rm ./result

num=$(($1+($i-1)*$3))

echo "sending $num ONS queries..."
for (( j=1; j<=num; j++ ))
do
	dig @$4 3.5.1.0.0.0.0.0.0.0.0.8.8.gtin.gs1.id.onsepc.kr naptr | awk -f parsing.awk >> result 
done

echo "---Results---"

awk -v n=$num -f average.awk result
echo ""
done
