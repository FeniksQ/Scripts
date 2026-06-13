#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install iptables
sudo apt install iptables-persistent 
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -P INPUT DROP
sudo netfilter-persistent save
sudo apt install git wget curl ruby -y
wget https://raw.githubusercontent.com/FeniksQ/Scripts/refs/heads/main/clport
clear
wget https://raw.githubusercontent.com/FeniksQ/Scripts/refs/heads/main/opport
clear
sudo mv clport /usr/local/bin/
sudo chmod 777 /usr/local/bin/clport
sudo mv opport /usr/local/bin/
sudo chmod 777 /usr/local/bin/opport
clear
echo -e "If you want to open a port, just type opport 20. \nThis is an example; replace 20 with your number. \nTo close, it's similar, but use clport followed by your value."
echo "Enjoy using it"



