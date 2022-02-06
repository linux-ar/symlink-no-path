#!/bin/sh

test -f ~/.ssh/id_ed25519 && rm -f ~/.ssh/id_ed25519
test -f ~/.ssh/id_ed25519.pub && rm -f ~/.ssh/id_ed25519.pub
echo "\nssh-key\n"
cat /dev/zero | ssh-keygen -t ed25519 -C "ayoubelmhamdi@gmail.com" -q -N ""
echo  "\n\n"
cat ~/.ssh/id_ed25519.pub
