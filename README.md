ssh_keycase
===========

This is the bash script to make it easier to manage the configuration.

* organizing and managing the .ssh/config file
* organizing and managing the private key

#### Example

~~~
.ssh
├── conf.d
│   ├── default.conf
│   ├── private
│   │   └── gitrepos.conf
│   └── dev_servers.conf
├── config
└── key.d
    ├── private
    │   └── gitrepos
    │       ├── id_rsa.github
    │       └── id_rsa.bitbucket
    └─- dev_servers
        ├── id_rsa.dev1
        └── id_rsa.dev2
~~~


Installation
------------
	curl -L https://raw.github.com/mesiobass/ssh_keycase/master/install | bash
	
Getting Started
---------------

#### Create the directories and files needed to manage
~~~
keycase init
~~~

* create .ssh directory
* create .ssh/conf.d directory
* create .ssh/conf.d/default.conf file

| directory or file name  | description         |
| :---------------------- |--------------------:|
| .ssh/conf.d             | directory in which to manage the config file by category |
| .ssh/conf.d/default.conf| file that manages the setting to be used in common |

Usage
-----
	keycase [Action] [Arguments]
	keycase keyset [Action] [Arguments]
	
### 1. keycase

#### Generate config file

~~~
keycase save
~~~

* generate the .ssh/config file by merging all the files in .ssh/conf.d directory

#### Show host list

~~~
keycase list
~~~

#### Show host detail that your specify

~~~
keycase show [Host]
~~~

* Specify the [Host] keyword in the .ssh/config file

#### Show help

~~~
keycase usage
~~~

Or

~~~
keycase help
~~~

#### Show the keycase version installed

~~~
keycase version
~~~

### 2. keycase keyset

* sub-command to create a directory for managing each category the private key

#### Create a category direction


~~~
keycase keyset create [Category]
~~~

* create .ssh/key.d directory
* create .ssh/key.d/[Catfegory] directory
* create .ssh/conf.d/[Category].conf file

License
=======

Copyright 2014 mesiobass

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.





