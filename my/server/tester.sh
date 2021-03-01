URL="https://youtu.be/-bfbtaZ6VXc"
STARTVIDEO=13
ENDVIDEO=44
export URL
export STARTVIDEO
export ENDVIDEO
echo "in tester.sh $URL $STARTVIDEO $ENDVIDEO"
echo "exec server .sh"
source $HOME/scripts/my/video/server.sh

