#!/bin/bash

git checkout master
echo "*Delete local release branch"
echo "git branch -d release"
git branch -d release
echo "*Delete remote release branch"
echo "git push origin --delete release"
git push origin --delete release

echo "Now recreate the release branch local and push to remote"
git checkout master
git checkout -b release
git push -u origin release
git checkout master

echo "*Here are all the branches:"
git branch -a
