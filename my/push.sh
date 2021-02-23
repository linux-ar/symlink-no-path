#!/bin/bash

git status
git add -u
git status
git commit -m "$1"
git push
