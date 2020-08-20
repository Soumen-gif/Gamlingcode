
stakes=100
bet=1
winTarget=100
loseTarget=50
doingBet(){
        if [ $((RANDOM % 2)) -eq 1 ]
        then
                Stakes=$(($stakes + $bet))
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
	    totalGain=$(($stakes-100))
     }

noOfDays(){
      for ((i=1;i<=20;i++))
        do
	       day
	      echo "Day:$i	    stakes:$stakes"
       	totalAmount=$(($totalAmount+$totalGain))
        done
       if [ $totalAmount -gt 0 ]
       	then
		     echo "The amount he gains: $totalAmount"
       else
                echo "The amount he lost: $totalAmount"
        fi
          }
noOfDays

