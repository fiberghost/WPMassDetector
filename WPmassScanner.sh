#!/bin/bash

#Author: Ahmed Abbas Mohammed 
#Version: 1.0

# Clear the Screen
clear

#print the logo
echo " _    __________  ___             ______     _            _             
| |  | | ___ \  \/  |             |  _  \   | |          | |            
| |  | | |_/ /      | __ _ ___ ___| | | |___| |_ ___  ___| |_ ___  _ __ 
| |/\| |  __/| |\/| |/ _  / __/ __| | | / _ \ __/ _ \/ __| __/ _ \|  __|
\  /\  / |   | |  | | (_| \__ \__ \ |/ /  __/ ||  __/ (__| || (_) | |   
 \/  \/\_|   \_|  |_/\__ _|___/___/___/ \___|\__\___|\___|\__\___/|_|   "

echo ""
echo "" 

while read line
do
    url=$line
    wget $url -q -O -> index.html
    grep -F 'wordpress' index.html > grepRes.txt
    if [ -s grepRes.txt ]
    then 
        echo $url >> WPsites.txt
    fi
done < $1

#Output the detection results
while read line
do
    url=$line
    echo -e "\e[32m" " [+] WordPress Detected:" "\e[39m" $url
done < $2
echo ""
echo ""
