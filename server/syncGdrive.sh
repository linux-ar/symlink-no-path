#!/bin/bash
docker pull ashael/grive
mkdir /home/MyGoogleDriveFoldeName
cd /home/MyGoogleDriveFoldeName
docker run  -it -v $PWD:/home/grive -w /home/grive grive
grive -a
sleep 66
docker run --rm -v $PWD:/home/grive -w /home/grive --name "Gdrive" -u $(id -u):$(id -g) ashael/grive grive
