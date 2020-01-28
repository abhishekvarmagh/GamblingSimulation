#! /bin/bash

echo "Gambling Simulation Problem"

STAKE=100
BET=1
PERCENT=50
WON=$(( STAKE+(PERCENT*100/STAKE) ))
LOOSE=$((STAKE-(PERCENT*100/STAKE)))
DAY_IN_MONTH=20

declare -A perDay

totalAmount=0

function bet()
{
	if [ $(( RANDOM%2 )) -eq 1 ]
	then
		cash=$(( cash+BET ))
	else
		cash=$(( cash-BET ))
	fi
}

for (( i=1; i<=$DAY_IN_MONTH; i++ ))
do
	cash=$STAKE
	while [[ $cash -ne $LOOSE && $cash -ne $WON ]]
	do
		bet
	done
	perDay[Day"$i"]=$(( cash-STAKE ))
	totalAmount=$(( totalAmount+perDay[Day"$i"] ))
done

echo "Total Amount Won And Loose : "$totalAmount
