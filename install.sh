#!/bin/bash

install_tool(){

echo -e "\n-----------------------INSTALLING GOLANG------------------------"
sudo apt update
sudo apt install golang
sudo apt install python3
sudo apt install python3-pip
pip3 install uro
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go get github.com/haccer/subjack
go get github.com/tomnomnom/waybackurls
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go get -u github.com/tomnomnom/assetfinder
git clone https://github.com/orwagodfather/WordList.git
git clone https://github.com/six2dez/OneListForAll.git
go install github.com/ffuf/ffuf@latest
mv WordList wordlist
mv OneListForAll/*.txt -r wordlist








echo -e "\n-----------------------TOOL INSTALLATION COMPLETE------------------------"





}
install_tool


