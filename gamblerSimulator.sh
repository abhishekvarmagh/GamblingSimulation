#! /bin/bash

echo "Gambling Simulation Problem"

STAKE=100
BET=1
PERCENT=50
WON=$(( STAKE+(PERCENT*100/STAKE) ))
LOOSE=$((STAKE-(PERCENT*100/STAKE)))

function bet()
{
	if [ $(( RANDOM%2 )) -eq 1 ]
	then
		cash=$(( cash+BET ))
	else
		cash=$(( cash-BET ))
	fi
}

cash=$STAKE
while [[ $cash -ne $LOOSE && $cash -ne $WON ]]
do
	bet
done

echo $cash
