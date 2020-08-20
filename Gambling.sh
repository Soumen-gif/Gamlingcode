
echo "Welcome to gamling code"
#!/bin/bash -x

day=0
Stakes=100
bet=1
winTarget=150
loseTarget=50
    doingBet(){
        if [ $((RANDOM % 2)) -eq 1 ]
        then
                echo "he Won the match"
                stakes=$(($stakes + $bet))
        else
                echo "he lose the game"
                stakes=$(($stakes - $bet))
        fi
        }

noOfDay(){
        stakes=100
        while [ $stakes -lt $winTarget ] && [ $stakes -gt $loseTraget ]
        do
                doingBet
        done
        echo "Your final stake = $stakes"
}
noOfDay
