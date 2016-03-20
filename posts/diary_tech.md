Date: 2016-03-20
Title: 技术学习笔记
intro: 一些杂乱的技术笔记 学到哪儿记到哪儿 寸劲寸进
Tags: diary tech
Status: public
Toc: yes
Position: 991

#2016-03-15
===========
useradd 添加新用户
----------
useradd -d /usr/sam -m sam
-d 制定用户主目录
-m 创建主目录

gpasswd 工作组文件 /etc/group 和 /etc/gshadow 管理工具
---------
gpasswd -a sam sudo
-a 添加用户到组
-d 从组删除用户

newgrp 改变当前用户的有效群组
---------
newgrp sudo

#2016-03-20
===========
docker 学习
-----------
安装
	yum -y install docker

版本信息
	docker version

docker信息
	docker info

搜索镜像
docker search <image>
	docker search ubuntu12.04

下载镜像
docker pull <image>
	docker pull ubuntu 12.04

查看镜像
docker images
	docker images -a 包含历史
docker rmi <image ID...> 删除镜像

使用镜像创建容器
docker run REPOSITORY:TAG COMMAND

交互式终端运行
docker run -it REPOSITORY:TAG COMMAND
	docker run -it docker.io/ubuntu:12.04 bash

查看容器
docker ps 当前所有正在运行的
docker ps -l 最近一次启动的
docker pa -a 包含历史
docker ps -q 最近一次运行的container ID

再次启动容器
docker start/stop/restart <container ID> 开启/停止/重启 container
docker attach <container ID> 连接一个正在运行的container实例
docker start -i <container ID> 启动一个container并进入交互模式 相当于先start 再 attach
docker run -it <image> /bin/bash 使用image创建container并进入交互模式 login shell 是 /bin/bash
docker run -it -p <host_port:container_port> 映射HOST端口到容器 方便外部访问容器内服务 host_port省略则表示动态端口

删除容器
docker rm <container ID...> 删除一个或多个container
docker rm `docker ps -a -q` 删除所有container
docker ps -a -q | xargs docker rm 同上
