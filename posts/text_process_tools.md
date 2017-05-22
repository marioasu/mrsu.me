Date: 2017-05-22
Title: Linux常用文本处理工具
intro: 总结一下经常用到的linux文本处理工具(命令)
Tags: linux gawk grep
Status: public
Toc: yes
Position: 988

文本处理通常需要合用很多工具，简单汇总一下，仅列出常用的选项

### grep
-E :    --extended-regexp 扩展的正则表达式  
-i :    --ignore-case 不分大小写  
-v :    --invert-match 选择不匹配的行  
-r :    --recursive 这个主要在目录下的文件中搜索匹配的内容，可以配合-n使用  
-n :    --line-number 同时输出行号  
--color:    为匹配内容添加颜色，通常在~/.bashrc中配置 alias grep='grep --color'  

### gawk
gawk的一般使用模式是 gawk [options] '[/pattern/ | expression] {action}'  
-F :    --field-separator 字段分隔符，默认是空格或tab  

### sed 流编辑器
sed [OPTION]... {script-only-if-no-other-script} [input-file]...  
-n :    只输出匹配的行  
-i :    直接在原文件上编辑  
表达式  
p 打印  
d 删除  
s 替换 紧跟s的字符就是查找串和替换串的分隔符  

### sort
-r :    --reverse 反向排序  
-n :    --numeric-sort 按数值排序  

### uniq 去除相邻重复行，通常先sort排序再uniq去重
-c :    --count 统计重复行数  
-i :    --ignore-case 不区分大小写的比较  
-u :    --unique 只打印没有重复的行  

通过管道组合这些工具就可以做一些文本查找替换，日志分析之类的事情了  
例如查找某nginx访问日志中ip请求量的top10可以用：  
cat nginx_access.log | gawk '{print $1}' | sort | uniq -c | sort -rn | head -n 10