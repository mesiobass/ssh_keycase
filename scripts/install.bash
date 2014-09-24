#!/usr/bin/env bash

repourl="https://github.com/mesiobass/ssh_keycase.git"
local_dir_path="${HOME}/.ssh_keycase"
path_add_script='PATH=${PATH}:${HOME}/.ssh_keycase/bin'


# 1) gitがあるか？
if [ ! $(which git) ]; then
	echo "no git"
	exit 1
fi

# 2) ホームディレクトリにインストール
git clone ${repourl} ${local_dir_path}

# 3) bashrcにパス通し
if [ -e ~/.bashrc ]; then
	echo "${path_add_script}" >> ~/.bashrc
fi




