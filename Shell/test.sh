#!/bin/sh
#test
SAVEDIFS=$IFS
IFS=:
c1=0
c2=0
c3=0
C1=0
C2=0
C3=0
while read ID CLASS SCORE
do
	case $CLASS in
	1301)  let C1+=1
	if [[ $SCORE>=90 ]]
	then
	let c1+=1
	fi
	;;
	1302) let C2+=1
	if [[ $SCORE>=90 ]]
	then
	let c2+=1
	fi
	;;
	1303) let C3+=1
	if [[ $SCORE>=90 ]]
	then
	let c3+=1
	fi
	;;
	esac
	echo "$ID $CLASS $SCORE"
done <pc.txt
echo "-------------------------------------------------"
echo "1301:$C1:$c1 `awk BEGIN'{printf "%.2f",'$c1'/'$C1'}'`"
echo "1302:$C2:$c2 `awk BEGIN'{printf "%.2f",'$c2'/'$C2'}'`"
echo "1303:$C3:$c3 `awk BEGIN'{printf "%.2f",'$c3'/'$C3'}'`"
IFS=$SAVEDIFSD
