for code in {0..255};
do 
echo \
	-e "\e[38;05;${code}m $code: this is colorTest : @#@#@#@#@#@#@#@#@#@#@#@#@#@"; 
done
