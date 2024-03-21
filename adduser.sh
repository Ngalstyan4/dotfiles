#!/bin/bash
# Credits to Rishabh Iyer
# The file used to be called "rishabh_secretary.sh":)
if [ $# -ne 2 ]; then
	echo "$0 <name> <ssh key>"
	exit 1
fi
NAME="$1"
SSH_KEY="$2"
sudo adduser --disabled-password --gecos "$NAME,,," $NAME
sudo mkdir /home/$NAME/.ssh
echo "$SSH_KEY" | sudo tee -a /home/$NAME/.ssh/authorized_keys
sudo chown $NAME:$NAME /home/$NAME/.ssh -R
sudo chmod 700 /home/$NAME/.ssh -R
echo "$NAME ALL=NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo
