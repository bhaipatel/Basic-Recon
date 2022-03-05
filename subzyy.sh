#!/bin/sh
filename=$1
while read line; do


mkdir -p recon


        
~/go/bin/./subfinder -d $line -o $line.txt
~/go/bin/./assetfinder --subs-only $line | tee -a $line.txt 
curl -s "https://jldc.me/anubis/subdomains/"$line | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" >> $line
curl -s "https://crt.sh/?q=%25."$line"&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' |tee $line.txt
~/go/bin/./amass enum -d $line -passive|tee $line.txt 
        




sort -u $line.txt -o $line.txt
        
        
        
       
~/go/bin/./nuclei -list $line.txt -t ~/nuclei-templates/subdomain-takeover -o recon/$1takeover.txt



done < $filename
#./sudomainTakeover.sh subs.txt
