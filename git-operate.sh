#!/bin/bash

array=("cloud-parent" "cloud-other" "cloud-gateway" "cloud-user")
for item in "${array[@]}"
do
  if [ -d ../$item ]; then
    cd ../$item || exit 1
    git pull origin master || echo $item" git pull fail"
    cd ../cloud-parent || exit 1
  else
    cd ../ || exit 1
    git clone git@github.com:YuboerChang/$item.git || echo $item" git clone fail"
    cd ./cloud-parent || exit 1
  fi
done

