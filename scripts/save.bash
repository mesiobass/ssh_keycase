#!/usr/bin/env bash

. ${SCRIPT_DIR}/functions.bash

declare -a paths

# conf.d/default.confを一番はじめにもってくるようにする
default_config_path="${CONFIGS_DIR}/${DEFAULT_CONFIG_FILE}"
[ -e ${default_config_path} ] && paths+=(${default_config_path})

# ファイルパスリストを生成
fetch_file_paths() {
	for name in $(ls ${1}); do
		local full_path="${1}/${name}"

		[ ${full_path} = ${default_config_path} ] && continue

		if [ -d ${full_path} ]; then 
			fetch_file_paths ${full_path}
			continue
		fi

		paths+=(${full_path})
	done
}

# 抽出したファイル全てをconfigファイルにマージする
fetch_file_paths ${CONFIGS_DIR}
cat ${paths[@]} > ${CONFIG_FILE}

# 実行ログ出力
for path in ${paths[@]}; do
	printf "%23s %s\n" $(log_success "merge" 1) ${path}
done

print_create ${CONFIG_FILE}

exit $?
