#!/usr/bin/env bash

. ${SRC_DIR}/functions.bash

cd ${CONFIG_DIR}
for filename in $(ls); do
	printf "%23s %s\n" $(log_success "merge" 1) ${filename}
done

print_create "config"


