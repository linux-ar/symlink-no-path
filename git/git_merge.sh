#!/bin/bash
git checkout master
git pull origin master
git merge $1
git push origin master
