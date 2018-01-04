#!/bin/bash
# A Installation Bash script for github on Ubuntu
# https://www.howtoforge.com/tutorial/install-git-and-github-on-ubuntu-14.04/
sudo apt-get install git
git config --global user.name "logansql"
git config --global user.email "XXX@youremail.com"
pwd
git init UbuntuSQL
cd UbuntuSQL
gedit README &
gedit sample.c &
git add README 
git add sample.ca
git add sample.c
git commit -m "Test git on Ubuntu"
git remote add origin https://github.com/loganSQL/UbuntuSQL.git
git push origin master

