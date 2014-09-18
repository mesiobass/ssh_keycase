#!/usr/bin/env bash

. ${SCRIPT_DIR}/functions.bash

# configファイルが存在しない場合はエラー
if [ ! -e ${SSH_DIR}/config ]; then
	log_error "config not found.\n" 1>&2
	exit 0
fi

target=1 # 指定したHostかフラグ

# 空白、空行を除去したconfigファイルから指定したHost情報のみ抽出して表示
sed -e '/^$/d' ${SSH_DIR}/config | while read line
do
	words=($(echo ${line} | tr -s ',' ' '))
	# コメントアウトは無視
	[ "${words[0]}" = "#" ] && continue

	# Host名の処理
	if [ "${words[0]}" = "Host" ]; then
		if [ "${words[1]}" = ${1} ]; then
			target=0

			printf "${line}\n"
			continue
		fi

		[ ${target} -eq 0 ] && break
		continue
	fi

	[ ${target} -ne 0 ] && continue

	printf "  ${line}\n"
done

exit $?
