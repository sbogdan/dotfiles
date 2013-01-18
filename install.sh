#!/usr/bin/env bash
function link_file {
source="${PWD}/$1"
target="${HOME}/${1/_/.}"

if [ -e "${target}" ] && [ ! -L "${target}" ]; then
  mv $target $target.df.bak
fi

echo ln -sf ${source} ${target}
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
