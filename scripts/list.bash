#!/usr/bin/env bash

# 一覧表示
keycase_list() {
	if [ -f ${SSH_DIR}/config ]; then
		local hosts=()
		local comment
		local max_strlen=0

		while read line
		do
			line_ary=($(echo ${line} | tr -s ',' ' '))
			if [ "${line_ary[0]}" = "#" ]; then
				comment=${line_ary[1]}
			fi

			if [ "${line_ary[0]}" = "Host" ]; then
				local strlen=$(echo ${line_ary[1]} | wc -m)
				if [ ${strlen} -gt ${max_strlen} ]; then
					max_strlen=${strlen}
				fi
				hosts=(${hosts[@]} "${line_ary[1]},${comment}")
				comment=""
			fi
		done < ${SSH_DIR}/config

		for row in ${hosts[@]}; do
			row=($(echo ${row} | tr -s ',' ' '))
			printf "%-${max_strlen}s   # %s\n" ${row[0]} ${row[1]}
		done
	fi
}

keycase_list
