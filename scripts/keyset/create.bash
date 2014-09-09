#!/usr/bin/env bash

. ${SCRIPT_DIR}/functions.bash

keys_dir="${SSH_DIR}/key.d"
keyset_dir="${keys_dir}/${1}"
config_file="${CONFIGS_DIR}/${1}.conf"

keycase_mkdir ${keys_dir}   # .ssh/key.d/作成
keycase_mkdir ${keyset_dir} # .ssh/key.d/xxx/作成

# 多階層の場合はディレクトリを作成
if [ "${1%/*}" != "${1##*/}" ]; then
	keycase_mkdir "${CONFIGS_DIR}/${1%/*}"
fi

keycase_mkfile ${config_file} # .ssh/conf.d/xxx.conf作成

exit $?
