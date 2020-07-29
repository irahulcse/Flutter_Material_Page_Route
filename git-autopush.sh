#!/bin/sh
git pull origin master
git add .
git commit -m "First Commit using Bash Timestamp(`date +%F-%T`)"
git push -f origin master