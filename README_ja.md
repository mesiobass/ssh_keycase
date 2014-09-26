ssh_keycase
===========

ssh configを管理しやすくする為のbashコマンドです

* .sshのconfigファイルの整理、管理
* private keyの整理、管理

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

#### 管理に必要なディレクトリ、ファイルの作成
~~~
keycase init
~~~

* .sshディレクトリの作成
* .ssh/conf.dディレクトリの作成
* .ssh/conf.d/default.confファイルの作成

| directory or file name  | description         |
| :---------------------- |--------------------:|
| .ssh/conf.d             | 分類されたconfigファイルを管理するディレクトリ |
| .ssh/conf.d/default.conf| 全てのconfigファイルで共通で使用する設定を管理するファイル      |

Usage
-----
	keycase [Action] [Arguments]
	keycase keyset [Action] [Arguments]
	
### 1. keycase

#### configファイル生成

~~~
keycase save
~~~

* .ssh/conf.dディレクトリ内の全てのファイルをマージして.ssh/configファイルを生成

#### 設定しているホストリストを表示

~~~
keycase list
~~~

#### 指定したホスト情報を表示

~~~
keycase show [Host]
~~~

* configファイルにあるHostキーワードを指定

#### ヘルプ表示

~~~
keycase usage
~~~

Or

~~~
keycase help
~~~

#### バージョン表示

~~~
keycase version
~~~

### 2. keycase keyset

* private keyをカテゴリ毎に管理する為のディレクトリを作成するサブコマンド

#### カテゴリ分けの為のディレクトリ作成

~~~
keycase keyset create [Category]
~~~

* .ssh/key.dディレクトリを作成
* .ssh/key.d/[Category]ディレクトリを作成
* .ssh/conf.d/[Category].confファイルを作成

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





