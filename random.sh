#!/bin/bash
#
#
#
# Contact: rameshshihora@gmail.com
############################################

##
# Every 11PM it generats random hour min code which you can match against the previous one to execute the script 
# This helps if you do DNS look up from 1000 machines but all machines will run at random time to avoid the flooded DNS query to nameserver.
##


#=== Random Hour and Min generator ===
hr=`date +%H%M`
Rand="/home/rameshshihora/random"

HOUR=$(echo $(( $RANDOM % 12 )))
MIN=$(echo $(( $RANDOM % 60 )))

if [ $hr -eq "2300" ]
then
        FH=$(printf "%02d" $HOUR)
        FM=$(printf "%02d" $MIN)
        TM=$(echo $FH$FM)
        FADD=$(expr "$FH$FM" + 5)
        FD=$(printf "%04d" $FADD)
        echo "$TM $FD" > $Rand
fi

[ ! -f $Rand ] && echo "0010 0010" > $Rand
#=====

#if test $hr -ge 1829 -a $hr -lt 1839
if test $hr -ge $(cat $Rand | cut -c 1-4) -a $hr -lt $(cat $Rand | cut -c 6-10)
then   
	## your code here ..
else
	## your code here ..
fi
