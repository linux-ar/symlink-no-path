#!/bin/bash
title="$2"
# cd "/data/data/com.termux/files/home/storage/downloads/yyy/p5.js/"
cd "/opt/P5.JS"
mkdir $1
cd $1
touch index.html
touch sketch.js
touch sketch.js
touch style.css

# index.html
echo "<!DOCTYPE html>" >> index.html
echo "<html>" >> index.html
echo 
echo "<head>" >> index.html
echo "  <script src=\"/opt/P5.JS/Library/p5.js\"></script>" >> index.html
echo "<link rel=\"stylesheet\" href=\"style.css\">" >> index.html
echo "  <meta charset=\"utf-8\" />" >> index.html
echo "  <title>$title</title>" >> index.html
echo "</head>" >> index.html
echo 
echo "<body>" >> index.html
echo "  <script src=\"sketch.js\"></script>" >> index.html
echo "</body>" >> index.html
echo 
echo "</html>" >> index.html


# sketch.js
echo "function setup() {" >> sketch.js
echo "    createCanvas(640,360);" >> sketch.js
echo "}" >> sketch.js
echo 
echo "function draw() {" >> sketch.js
echo "    background(127);" >> sketch.js
echo "}" >> sketch.js
echo 
