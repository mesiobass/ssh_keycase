#!/usr/bin/env bash

log_info() {
	local style=${2:-0}
	printf "\033[${style};34m${1}\033[0m"
}

log_success() {
	local style=${2:-0}
	printf "\033[${style};32m${1}\033[0m"
}

log_error() {
	local style=${2:-0}
	printf "\033[${style};31m${1}\033[0m"
}

log_warning() {
	local style=${2:-0}
	printf "\033[${style};33m${1}\033[0m"
}

print_exist() {
	printf "%23s %s\n" $(log_info "exist" 1) $1
}

print_create() {
	printf "%23s %s\n" $(log_success "create" 1) $1
}

print_conflict() {
	printf "%23s %s\n" $(log_error "conflict" 1) $1
}

print_skip() {
	printf "%23s %s\n" $(log_warning "skip" 1) $1
}


# 指定ディレクトリがない場合は作成して、パーミッションを700に設定する
keycase_mkdir() {
	local dir_path=$1

	if [ -d ${dir_path} ]; then
		print_exist ${dir_path}
		return
	fi

	print_create ${dir_path}
	mkdir -m 700 ${dir_path}
}

# 指定ファイルがない場合は作成して、パーミッションを600に設定する
keycase_mkfile() {
	local file_path=$1

	if [ -e ${file_path} ]; then
		print_exist ${file_path}
		return
	fi

	print_create ${file_path}
	touch ${file_path}
	chmod 600 ${file_path}
}
