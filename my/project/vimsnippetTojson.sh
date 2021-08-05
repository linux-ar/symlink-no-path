#!/bin/bash

file="$1"
#TODO: remove line that:start with pre_expand | priority
sed -E -i 's/^([try,if,set]|[^snippet,endsnippet]).*/         "&",/' $file
sed -E -i 's/^snippet (\w*) (".*") \w/  \2: {\n     "prefix": ["\1"],\n     "description": \2,\n     "body": [/' $file
sed -E -i 's/^endsnippet/     ],\n  },/' $file
perl -0777 -i -pe 's/",\n     ],\n  },/"\n     ]\n  },/g' $file



sed -E -i '/^$/d' $file # empty line
sed -i '1 i\{' $file    # add first line
echo "}" >> $file       # add last line
# copy jq
# vim make prefix in one line
#g/prefix.:\s/s/\(.*\)\n *\(.*\)\n *\(.*\)/\1\2\3/
