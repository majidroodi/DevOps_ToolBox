#! /usr/bin/bash

# Variables For SSH

SSH_PORT=8585
ROOT_LOGIN=PermitRootLogin
PASS_AUTH=PasswordAuthentication
CHALLANGE_AUTH=ChallengeResponseAuthentication


echo "------------------------------ MOST SSH CONFIGURATION ------------------------------"


echo "Port $SSH_PORT" >> /etc/ssh/ssh_config
echo "$ROOT_LOGIN no" >> /etc/ssh/ssh_config
echo "$PASS_AUTH no" >> /etc/ssh/ssh_config
echo "$CHALLANGE_AUTH no" >> /etc/ssh/ssh_config

sudo service ssh restart





