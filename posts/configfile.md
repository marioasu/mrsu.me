Date: 2017-08-03
Title: 我的Linux软件配置文件
intro: 常用的Linux软件配置文件，随时更新。分享一下，也方便自己查找
Tags: Linux
Status: public
Toc: yes
Position: 982

### Vim - ～/.vimrc
```
set number
set ts=4
set expandtab
set shiftwidth=4
set autoindent
```

### ssh - ~/.ssh/config
```
Host *
ControlMaster auto
ControlPath ~/.ssh/cm_socket/%r@%h:%p
ServerAliveInterval 10

Host linode
    HostName 139.162.*.*
    Port 2***
    User admin
```

### git - ~/.gitconfig
```
[alias]
    st = status
    co = checkout
    ci = commit
    br = branch
    df = diff -b
    dc = diff --cached
    pl = pull --rebase
    cm = commit --amend --no-edit
[core]
    excludesfile = ~/.gitignore
[push]
    default = current
```

### shadowsocks - ~/shadowsocks/config.json
```
{
    "server":"139.162.*.*",
    "server_port":8388,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"********",
    "timeout":300,
    "method":"aes-256-cfb"
}
```
