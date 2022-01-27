#!/bin/bash
. /home/ubu/.bashrc

# make the script executable
# chmod +x make-square-script.sh

major=0
minor=0
build=0
version="$(grep -oP '^ver\s+\K\S\S\S\S\S' /home/ubu/Green-Square/readme.md)"
regex="([0-9]+).([0-9]+).([0-9]+)"

# compare version to regex, split regex match into 3 arrays
if [[ $version =~ $regex ]]; then
	major="${BASH_REMATCH[1]}"
	minor="${BASH_REMATCH[2]}"
	build="${BASH_REMATCH[3]}"

# increment build 

build=$(echo $build + 1 | bc)

# write to readme.md

echo "ver ${major}.${minor}.${build}" > /home/ubu/Green-Square/readme.md

# add, commit, push
cd /home/ubu/Green-Square/
/usr/bin/git add .
/usr/bin/git commit -m "increment to ${major}.${minor}.${build}"
/usr/bin/git push origin master

else
  echo "usage: ./make-square-script.sh"
  echo "version:" $version
  echo "regex:" $regex
  exit -1
fi


# echo the new version number
# echo "new version: ${major}.${minor}.${build}"
