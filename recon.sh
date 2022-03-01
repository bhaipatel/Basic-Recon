#!/bin/bash

domain=$1
path=$domain/Recon
gopath=~/go/bin
nuct=~/nuclei-templates


passive_enum(){
mkdir -p $domain  $domain/Recon $domain/Recon/subs

$gopath/./subfinder -d $domain -v -o  $path/subs/subfinder.txt
$gopath/./assetfinder [--subs-only] $domain | tee $path/subs/asset.txt
cat $path/subs/*.txt | sort -u | tee $path/subs/subdomains.txt



}
passive_enum
subjack_check(){

$gopath/./subjack -w $path/subs/subdomains.txt -t 100 -timeout 30 -o $path/subjack.txt -ssl

}
subjack_check


alive_check(){
cat $path/subs/subdomains.txt | httpx -thread 200 -o $path/alive.txt 
}
alive_check


scan_check(){
cat $path/alive.txt | $gopath/./nuclei -t $nuct -c 50 -o $path/scan.txt
}
scan_check

wayback_check(){
cat $path/alive.txt | $gopath/./waybackurls | tee $path/wayback1.txt
cat $path/wayback1.txt | uro | tee $path/wayback.txt 
rm wayback1.txt
}
wayback_check














