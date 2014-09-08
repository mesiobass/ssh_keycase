#!/usr/bin/env bash

. ${SCRIPT_DIR}/functions.bash

keyset_script_path=${SCRIPT_DIR}/keyset/${1}.bash
printf "${keyset_script_path}\n"
[ ! -x ${keyset_script_path} ] && keyset_script_path=${SCRIPT_DIR}/usage.bash

shift 

exec ${keyset_script_path} "$@"
