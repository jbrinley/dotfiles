#!/usr/bin/env bash

srcdir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
cd ${srcdir}

git pull origin master;

function doIt() {
	include=( ".vim" ".aliases" ".bash_profile" ".bash_prompt" ".bashrc" ".curlrc" ".docker-functions" ".editorconfig" ".exports" ".functions" ".gdbinit" ".gitattributes" ".gitconfig" ".gitignore" ".gvimrc" ".hgignore" ".hushlogin" ".inputrc" ".nvm_profile" ".path" ".screenrc" ".tmux.conf" ".vimrc" ".wgetrc" );

	target=${HOME};

	for file in ${include[@]}; do
		rm -rf ${target}/${file}
		ln -s ${srcdir}/${file} ${target}/${file};
	done;

	source ${target}/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
