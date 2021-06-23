#!/bin/bash

sed -i                                                                   \
    's/GETTY_ARGS="--noclear"/GETTY_ARGS="--noclear --autologin root"/'  \
     /etc/sv/agetty-tty1/conf
