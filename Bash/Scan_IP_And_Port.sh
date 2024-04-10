#!/bin/bash

echo "Enter the starting IP address : "

read FirstIP

echo "Enter the subnet like (/24) : "

read subnet

echo "Enter the port number you want to scan for : "

read port

nmap -sT $FirstIP-$subnet -p $port >/dev/null -oG myscan

cat myscan | grep open > FinalScan

cat FinalScan