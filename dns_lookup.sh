#!/bin/bash

#function to perfom forward DNS lookup (A & AAA)
forward_lookup(){
    echo "Forward DNS Lookup for $1:"
    echo "A Records"
    host -t A "$1"
    echo "AAA Records:"
    host -t AAAA "$1"
}

#function to perform reverse DNS lookup (PTR)
reverse_lookup(){
    echo "Reverse DNS Lookup for $1:"
    echo "PTR Records:"
    host -t PTR "$1"
}

#main script
clear

read -p "Enter a domain or IP address: " target

#check if the target is an IP Address
if [[ $target =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    forward_lookup "$target"
else
#perform a forward lookup first
    forward_lookup "$target"
#if its a domain, perform a reverse lookup
    reverse_lookup "$target"
fi