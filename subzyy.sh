#!/bin/sh
filename=$1
while read line; do
        echo "sufinder"
         ~/go/bin/./subfinder -d $line -o $line.txt
              
        echo "Subjack"
        ~/go/bin/./subjack -w $line.txt -t 1000 -o $1takeover.txt
done < $filename
#./sudomainTakeover.sh subs.txt
