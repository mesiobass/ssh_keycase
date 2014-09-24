ssh_keycase
===========

sshconfigを管理するbashスクリプト

Installation
------------
	curl -L https://raw.github.com/mesiobass/ssh_keycase/master/install | bash
	
Getting Started
---------------
* Create .ssh directory and .ssh/conf.d directory, .ssh/conf.d/default.conf

~~~
keycase init
~~~

| directory or file name  | description         |
| :---------------------- |--------------------:|
| .ssh/conf.d             | managed config file |
| .ssh/conf.d/default.conf| shared setting      |

Usage
-----
	keycase [Action] [Arguments]
	keycase keyset [Action] [Arguments]




