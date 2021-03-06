#!/bin/bash

# make this script executable
# chmod +x make-square-script.sh

#your computer user
USER=jnorr

major=0
minor=0
build=0
version="$(grep -oP '^ver\s+\K\S\S\S\S\S' /home/$USER/Green-Square/readme.md)"
regex="([0-9]+).([0-9]+).([0-9]+)"

# compare version to regex, split regex match into 3 arrays
if [[ $version =~ $regex ]]; then
	major="${BASH_REMATCH[1]}"
	minor="${BASH_REMATCH[2]}"
	build="${BASH_REMATCH[3]}"

# increment build 

build=$(echo $build + 1 | bc)

# write to readme.md

#echo "ver ${major}.${minor}.${build}" >> /home/$USER/Green-Square/readme.md
#find the old version number, replace it with the new version number
sed -i -e "s/$version/$major.$minor.$build/g" /home/$USER/Green-Square/readme.md

# add, commit, push
cd /home/$USER/Green-Square/
/usr/bin/git add .
/usr/bin/git commit -m "increment to ${major}.${minor}.${build}"
/usr/bin/git push origin master

else
  echo "Something went wrong"
  exit -1
fi


# echo the new version number
# echo "new version: ${major}.${minor}.${build}"
