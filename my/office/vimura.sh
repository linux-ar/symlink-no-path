#!/bin/sh
echo $1
zathura  -x "nvim --servername $1 -c \"let g:syncpdf='$1'\" --remote +%{line} %{input}" $*
