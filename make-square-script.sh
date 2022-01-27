#!/bin/bash

# make the script executable
# chmod +x make-square-script.sh

major=0
minor=0
build=0
version="$(grep -oP '^ver\s+\K\S\S\S\S\S' readme.md)"
regex="([0-9]+).([0-9]+).([0-9]+)"

# compare version to regex, split regex match into 3 arrays
if [[ $version =~ $regex ]]; then
	major="${BASH_REMATCH[1]}"
	minor="${BASH_REMATCH[2]}"
	build="${BASH_REMATCH[3]}"

# increment build 

build=$(echo $build + 1 | bc)

# write to readme.md

echo "ver ${major}.${minor}.${build}" > readme.md

# add, commit, push

git add .
git commit -m "increment to ${major}.${minor}.${build}"
git push origin master

else
  echo "usage: ./make-square-script.sh"
  echo "version:" $version
  echo "regex:" $regex
  exit -1
fi


# echo the new version number
# echo "new version: ${major}.${minor}.${build}"