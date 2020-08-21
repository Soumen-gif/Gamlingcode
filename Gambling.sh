#!/bin/bash -x
WON=0
Lose=0
STAKE=100
bet=1
winTarget=150
loseTarget=50
winDay=0
loseDay=0
beting(){
        if [ $((RANDOM % 2)) -eq 1 ]
        then
                STAKE=$(($STAKE + $bet))
        else
                STAKE=$(($STAKE - $bet))
        fi
}

day(){
        STAKE=100
        while [ $STAKE -lt $winTarget ] && [ $STAKE -gt $loseTarget ]
        do
                beting
        done
	actualGain=$(($STAKE-100))
}
a=0
total(){
for ((i=1;i<=30;i++))
do
	day
	echo "based on the Day:$i.......	days wise His Stake....$STAKE"
	if [ $STAKE -eq 150 ]
	then 
		WON=$(($WON + 50))
		winDay=$(($winDay + 1))
	else
		LOSE=$(($LOSE + 50))
		loseDay=$(($loseDay + 1))
	fi
	totalAmount=$(($totalAmount+$actualGain))
	daydict[$i]=$totalAmount
	arr[$a]=$totalAmount
	a=$(($a + 1))
done

for ((i=1;i<=30;i++))
do
	if ((daydict[i] == arr[$a-1]))
	then
		echo "Luckiest day of gambler was Day $i"
	fi
	if ((daydict[i] == arr[0]))
        then
                echo "Unluckiest day of gambler was Day $i"
        fi
done

echo "In a month he won $winDay days"
echo "amount gained is $WON"
echo "In a month he lost $loseDay days"
echo " amount loss is $LOSE"
if [ $totalAmount -gt 0 ]
	then
		echo "Amount won in a montrh.....$totalAmount"
        else
                echo "amount lost.......$totalAmount"
        fi
}
total
if [ $totalAmount -gt 0 ]
then
	echo "would u like to play for next month y/n"
        read data
	if (( $data == 'y'))
	then
		total
	fi
fi
