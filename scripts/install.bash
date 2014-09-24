#!/usr/bin/env bash

repourl="https://github.com/mesiobass/ssh_keycase.git"
local_dir_path="${HOME}/.ssh_keycase"
path_add_script='PATH=${PATH}:${HOME}/.ssh_keycase/bin'
git_command=$(which git)


# gitがあるか？
if [ ! -z "${git_command}" ]; then
	printf "git command not found\n"
	exit 1
fi

# ホームディレクトリにインストール
set -x
${git_command} clone ${repourl} ${local_dir_path}
set +x

# .bashrcにパス通し
if [ -e ~/.bashrc ]; then
	set -x
	echo "${path_add_script} # Add keycase to PATH for scripting." >> ~/.bashrc
	set +x
fi

# 終了
printf "done.\n\n"

exit $?
