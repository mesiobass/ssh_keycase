#!/usr/bin/env bash

cat << _EOT_
  Usage:
    keycase [action] [arguments]

  Action:
    init [small]    create ssh config directory
    list            show .ssh/config file
    show [hostname] show select host infor
    help            show this message. alias usage
    usage           show this message. alias help
_EOT_

