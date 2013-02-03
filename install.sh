#!/usr/bin/env bash
function link_file {
source="${PWD}/$1"
target="${HOME}/${1/_/.}"

if [ ! -e "${target}" ]; then 
  ln -sf ${source} ${target}
fi

}

function unlink_file {
source="${PWD}/$1"
target="${HOME}/${1/_/.}"

if [ -e "${target}.df.bak" ] && [ -L "${target}" ]; then
  unlink ${target}
  mv $target.df.bak $target
fi
}

for i in _*
do
  link_file $i
done

#git submodule update --init --recursive
#git submodule foreach --recursive git pull origin master
