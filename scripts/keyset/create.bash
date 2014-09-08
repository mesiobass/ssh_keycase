#!/usr/bin/env bash

. ${SCRIPT_DIR}/functions.bash

keys_dir="${SSH_DIR}/key.d"
keyset_dir="${keys_dir}/${1}"

keycase_mkdir ${keys_dir}   # .ssh/key.d/作成
keycase_mkdir ${keyset_dir} # .ssh/key.d/xxx/作成

exit $?
