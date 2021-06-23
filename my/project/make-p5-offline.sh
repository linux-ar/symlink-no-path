#!/bin/sh

#file=$1
#sed -i 's/https.*p5\.min\.js/p5\.min\.js/' $file
#sed -i 's/https.*p5\.dom\.min\.js/p5\.dom\.min\.js/' $file


find . -type f -name "*.html" -exec sed -i 's/https.*p5\.min\.js/p5\.min\.js/' {} ';'
find . -type f -name "*.html" -exec sed -i 's/https.*p5\.dom\.min\.js/p5\.dom\.min\.js/' {} ';'
