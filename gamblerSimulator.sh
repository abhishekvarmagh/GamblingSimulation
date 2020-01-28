#! /bin/bash

echo "Gambling Simulation Problem"

STAKE=100
BET=1

function bet()
{
	cash=$STAKE
	if [ $(( RANDOM%2 )) -eq 1 ]
	then
		cash=$(( cash+BET ))
		echo "Win"
	else
		cash=$(( cash-BET ))
		echo "Loose"
	fi
}

bet
