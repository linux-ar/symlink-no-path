#!/bin/bash

st &

rm -f /mega/cloud/blur/bg.ff && 
rand="$(ls /mega/cloud/blur/ | shuf -n 1)" &&
ln -s "/mega/cloud/blur/$rand" /mega/cloud/blur/bg.ff

