#!/bin/sh

add=0
x=5
t=("3" "6" "9" "12")
y=("9" "36" "81" "144")
for k in $t ;do
	multi=1
	for i in $(seq 0 $k) ;do # all num but i want just in list
		$multi=`expr $multi*(($x-${t[i]})/(${y[k]}-${t[i]}))`
	done
	$add=`expr $add+${y[k]}*$multi`

done

# 480p hd fhd 2k 4k 6k 8k
# hd: ssd 500mb/s + cpu 5000p +gpu 7000p = 60fps
# or 
# hd: ssd 500mb/s + cpu 5000p +gpu 7000p = 1
# 0 open pc
# 1 open internet+word+youtube smouthly
# 2 open cooding
# 3 edit video 2k
# 3 edit video 4k
# 4 edit video 8k

