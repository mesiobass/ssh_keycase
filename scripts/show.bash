#!/usr/bin/env bash


# 指定Host情報を表示
keycase_show() {
	if [ -f ${SSH_DIR}/config ]; then
		local target=1

		sed -e '/^$/d' ${SSH_DIR}/config | while read line
		do
			line_ary=($(echo ${line} | tr -s ',' ' '))
			if [ "${line_ary[0]}" = "#" ]; then
				continue
			fi


			if [ "${line_ary[0]}" = "Host" ]; then
				if [ "${line_ary[1]}" = $1 ]; then
					target=0
				else
					if [ ${target} -eq 0 ]; then
						break
					fi

					continue
				fi
			fi

			if [ ${target} -ne 0 ]; then
				continue
			fi

			printf "${line}\n"
		done
	fi
}

keycase_show "$@"
