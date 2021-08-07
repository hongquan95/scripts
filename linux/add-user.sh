#!/usr/bin/env bash

help() {
  cat <<EOF
  Arguments:
  +\$1 given username
  Usage example:
  $ ./add-docker-user.sh tom
EOF
}

# init vars
USR=$1
if [[ -z $USR ]]; then
  help
  exit 1
fi

# generate SSH key pairs
# REF. https://stackoverflow.com/a/43235320/1235074

# Run as sudo
sudo su
# create new user
useradd -m -d /home/$USR -s /bin/bash $USR
mkdir /home/$USR/.ssh
chown dog:dog /home/dog/.ssh/
su - $USR
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
echo "DONE. User $USR user added"
exit