#!/usr/bin/env bash

. ${SCRIPT_DIR}/functions.bash

default_file_path="${CONFIGS_DIR}/${DEFAULT_CONFIG_FILE}"

keycase_mkdir ${SSH_DIR}            # .ssh/作成
keycase_mkdir ${CONFIGS_DIR}        # .ssh/conf.d/作成
keycase_mkfile ${default_file_path} # .ssh/conf.d/default.conf作成

exit $?
