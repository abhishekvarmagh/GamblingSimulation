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

function play()
{
	for (( i=1; i<=$DAY_IN_MONTH; i++ ))
	do
		cash=$STAKE
		while [[ $cash -ne $LOOSE && $cash -ne $WON ]]
		do
			bet
		done
		perDay[Day"$i"]=$(( cash-STAKE ))
		totalAmount=$(( totalAmount+perDay[Day"$i"] ))
		echo Day"$i" : ${perDay[Day"$i"]} : $totalAmount
		perDay[Day"$i"]=$totalAmount
	done
}

function luck()
{
	for i in ${!perDay[@]}
	do
		echo $i ${perDay[$i]}
	done | sort -k2 -$1 | head -1
}

while [ $totalAmount -ge 0 ]
do
	play
	echo "Luckiest Day : "
	luck rn
	echo "UnLuckiest Day : " 
	luck n
	echo "Total Amount Won And Loose : "$totalAmount
	if [ $totalAmount -ge 0 ]
	then
		read -p "Do you want continue [y/n] " input
		if [[ $input == "y" ]]
		then
			echo "Next Month"
		else
			break
		fi
	fi
done
