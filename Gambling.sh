#!/bin/bash -x

stakes=100
bet=1
winTarget=150
loseTarget=100

doingBet(){
        if [ $((RANDOM % 2)) -eq 1 ]
        then
                stakes=$(($stakes + $bet))
        else
                stakes=$(($stakes - $bet))
        fi
}

day(){
        stakes=100
        while [ $stakes -lt $winTarget ] && [ $stakes -gt $loseTarget ]
        do
                doingBet
        done
	actualGain=$(($stakes-100))
}
a=0
totalNoOfDays(){
for ((i=1;i<=30;i++))
do
	day
	echo "Day:$i	stakes:$stakes"
	if [ $stakes -eq 150 ]
	then 
		win=$(($win + 50))
		winDay=$(($winDay + 1))
	else
		lose=$(($lose + 50))
		loseDay=$(($loseDay + 1))
	fi
	totalAmount=$(($totalAmount+$actualGain))
	daydict[$i]=$totalAmount
	ar[$a]=$totalAmount
	a=$(($a + 1))
done

for ((i=1;i<=30;i++))
do
	if ((daydict[i] == ar[$a-1]))
	then
		echo "Luckiest day of gambler was Day $i"
	fi
	if ((daydict[i] == ar[0]))
        then
                echo "Unluckiest day of gambler was Day $i"
        fi
done

echo "Total number of days won in month is $winDay and amount gained is $win"
echo "Total number of days loose in month is $loseDay and amount loss is $lose"
if [ $totalAmount -gt 0 ]
	then
		echo "Total amount won in month: $totalAmount"
        else
                echo "Total amount lost in month: $totalAmount"
        fi
}
totalNoOfDays
