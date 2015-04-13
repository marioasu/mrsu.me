Date: 2015-04-11
Title: JustWriting 使用心得
intro: 项目前期最忙的一段时间接近尾声，终于有时间来捣鼓一个自己的博客，主要目的是记记笔记码码字儿。经木木同学推荐，幸运的在github上找到了JustWriting,一个极简开源博客系统，用Markdown就能书写，正和我意。
Tags: JustWriting 博客 使用
Status: public
Toc: yes
Position: 1000

### 看看安装部署过程中踩到的坑

- [Justwriting](https://github.com/hjue/JustWriting)是开源的,用[Markdown](http://wowubuntu.com/markdown/)就能书写
- 建议配置虚拟主机，而不是放入localhost根目录直接访问(框架路径规则貌似没完善到这一步)
- 像部署普通网站应用一样部署，开发时用的Mac上自带的环境(Apache/2.4.9 (Unix) + PHP 5.5.14)
- 如果遇到首页简介显示没问题，但是具体博文点进去显示Not Found或者Forbidden(404)多半是URL重写配置的问题(我就遇到了这个问题- -
	1. 在httpd.conf中加载rewrite模块
		LoadModule rewrite_module lib/httpd/modules/mod_rewrite.so 
	2. 配置虚拟主机的Directory
		AllowOverride All

### 个性化配置

- 页面设置主要通过网站根目录下面的settings.php完成，有注释，一目了然
- 模版默认是rock，不同的模板功能也不完全相同，看了一眼，tagside，好像是可以支持分类，deepure，感觉简介大方。
- 模版根目录是/templates，里面的四个模板我都不了解，熟悉下应该就可以个性化自己的页面了

### 博客正文

- 只需要在/posts文件夹中写一个md文件，就可以生成一篇博客
- 头部信息
	1. Status的可选值有public和draft，分别代表公开(发表)和草稿(不发表)
	2. Position用来排序，这个不太好控制，我从1000开始倒着计，遇到需要置顶的再用1、2、3...之类的小数字(机智乎?)。试了下，支持负数

### License

MIT
