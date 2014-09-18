#!/usr/bin/env bash

. ${SCRIPT_DIR}/functions.bash

# configファイルが存在しない場合はエラー
if [ ! -e ${SSH_DIR}/config ]; then
	log_error "config not found.\n" 1>&2
	exit 0
fi

declare -a hosts # 設定しているホストリスト
declare comment  # コメント
max_strlen=0     # ホスト名の最大文字数

# configファイルからHostの説明とHost名部分のみ抽出
while read line
do
	words=($(echo ${line} | tr -s ',' ' '))
	[ "${words[0]}" = "#" ] && comment=${words[1]}

	[ "${words[0]}" != "Host" ] && continue

	# Host名の長さがリスト中最大だったらHost名の長さを保持
	strlen=$(echo ${words[1]} | wc -m)
	[ ${strlen} -gt ${max_strlen} ] && max_strlen=${strlen}

	hosts=(${hosts[@]} "${words[1]},${comment}")
	comment=""
done < ${SSH_DIR}/config

# Host情報を整形して表示
for host in ${hosts[@]}; do
	words=($(echo ${host} | tr -s ',' ' '))
	printf "%-${max_strlen}s   # %s\n" ${words[0]} ${words[1]}
done

exit $?
