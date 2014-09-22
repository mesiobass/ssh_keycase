#!/usr/bin/env bash

cat << _EOT_
  Usage: keycase [action] [arguments]
         keycase keyset [action] [arguments]

  Action:
    keycase:
      init               create ssh config directory
      list               show .ssh/config file
      show [hostname]    show select host information
      save               create or update .ssh/config
      usage              show this message. alias help
      help               show this message
      version            show version number

    keycase keyset:
      create [hostname]  create .ssh/key.d directory and .ssh/conf.d/[hostname].conf file

_EOT_

