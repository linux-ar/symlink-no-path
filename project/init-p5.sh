#!/bin/bash
if [[ $# < 2 ]];then exit 1;fi

dir="/projects/p5/$1"
title="$2"
mkdir $dir/lib -p
touch $dir/index.html
touch $dir/sketch.js
touch $dir/style.css
cp -f $dir/../p5.js $dir/lib

# index.html
echo "<!DOCTYPE html>
<html>

<head>
  <script src=\"lib/p5.js\"></script>
<link rel=\"stylesheet\" href=\"style.css\">
  <meta charset=\"utf-8\" />
  <title>$title</title>
</head>

<body>
  <script src=\"sketch.js\"></script>
</body>

</html>" >> $dir/index.html


# sketch.js
echo "
function setup() {
    createCanvas(640,360);
}

function draw() {
    background(127);
}
" >> $dir/sketch.js
