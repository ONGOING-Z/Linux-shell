## Linux Shell

记录一些从[Linux Shell脚本攻略][1]上学到的有趣知识。

----
1.2 终端打印

echo && printf

1.3 玩转变量和环境变量

1. 获取字符串长度
```bash
$ length=${#var}
```

1.4 通过shell进行数学运算

介绍了一些数学工具例如`bc`等。

1.5 玩转文件描述符和重定向

文件描述符是与一个打开的文件或数据流相关联的整数。文件描述符0/1/2是系统预留的。
`0` - stdin
`1` - stdout
`2` - stderr

`>`会先清空文件，再写入内容; `>>`将内容追加到现有文件的尾部。
`2>&1`/`&>` 将`stderr`转换为`stdout`，使得`stderr`和`stdout`都被重定向到同一个文件中。

1.6 数组和关联模块
bash支持普通数组和关联数组。普通数组只能使用整数作为数组索引，而关联数组可以使用字符串作为数组索引。

1.7 使用别名

`alias`
`unalias`
alias的命令的作用只是暂时的。一旦关闭当前终端，所有设置的别名就失效了。为了使别名设置一直保持作用，可以将它放入`~/.bashrc`文件中。

1.8 获取终端信息

获取终端行数: `tput cols`
获取终端列数: `tput lines`

1.9 获取、设置日期和延时

计算命令的时间例子
```sh
#!/bin/bash
# Filename: time.sh
start=$(date +%s)
mkdir test; cd test; > test.txt

end=$(date +%s)
differences=$(( end - start ))
echo Time taken to execute commands is ${differences} seconds.
```

1.10 调试脚本

使用选项`-x`，启动跟踪调试shell的脚本:
```bash
$ bash -x script.sh
```

在脚本中加入`set built-in`启用或禁止调试打印。
```
set -x: 在执行时显示参数和命令
set +x: 禁止调试
set -v: 当命令进行读取时显示输入
set +v: 禁止打印输入
```

1.11 函数和参数

定义函数
```sh
function fname()
{
statements;
}
```

调用函数
```bash
$ fname
```

读取命令返回值
```bash
cmd;
echo $?;
```
`$?`会给出命令cmd的返回值。返回值被称为退出状态，可用于分析命令执行成功与否。若命令成功退出，退出状态为0,否则为非0.

1.12 读取命令序列输出
使用管道(pipe)来连接每一个过滤器。
eg. `$ cmd1 | cmd2 | cmd3`
这里cmd1的输出传递给cmd2, cmd2的输出传递给cmd3.

1.13 read
`read -n number_of_chars variable_name`
eg.
```bash
$ read -n 2 var
$ echo $var
$ read -s var # 不回显方式读取密码
$ read -p "Enter input: " var # 显示提示信息
```

1.14 (jump)
1.15 (jump)

*Chapte 1 finished*

----

Chapter2 命令之乐

2.2 用cat进行拼接

2.3 录制和回放终端会话(jump)
2.4 文件查找和文件列表
`find`
usage: `$ find base_path`
(1)列出当前目录及子目录下所有文件及文件夹
```bash
$ find . -print
```
`-print`指明打印出匹配文件的文件名（路径）。`\n`作为用于分隔文件的定界符。

(2)根据文件名或正则表达式匹配搜索

```bash
$ find . -name "*.txt" -print
```
选项`-name`的参数指定了文件名必须匹配的字符串。
选项`-iname`可以忽略字母大小写。
(3)否定参数
```bash
$ find . ! -name "*.txt" -print
```
匹配所有不以.txt结尾的文件名。
(4)目录深度
```bash
$ find . -maxdepth 1
```
(5)根据文件类型搜索
`-type`可以对文件搜索进行过滤。
列出所有的目录：`$ find . -type d -print`

文件类型 | 类型参数
普通文件 | f
目录     | d
符号链接 | l

(6)删除匹配的文件
`-delete`可用来删除find查找到的匹配文件
eg. 删除当前目录下所有的`.swp`文件
```bash
$ find . -type f -name "*.swp" -delete
```
**attention**: 某些小节是跳过了的

2.5 玩转xargs(jump)
2.6 用tr进行转换(jump)

> tr可以对来自标准输入的字符进行替换、删除以及压缩。
> 它可以将一组字符变成另一组字符，故也被称为translate命令。

2.7 核验与核实(jump)
2.8 排序、单一和重复

`sort`
(1)按数字进行排序
```bash
$ sort -n file.txt
```
(2)按逆序进行排序
```bash
$ sort -r file.txt
```
(3)按第一列进行排序
选项`-k`
```bash
# 依据第一列，顺序排序
$ sort -nk 1 file.txt
```

`uniq`: 通过消除重复内容，从给定输入中找出单一的行。
usage: `$ uniq file.txt`
(1)只显示“唯一”的行
```bash
$ uniq -u file.txt
```
(2)统计各行在文件中出现的次数
```bash
$ uniq -c file.txt
```
(3)显示文件中重复的行
```bash
$ uniq -d file.txt
```
*最后一部分跳过了*

2.9 临时文件命名和随机数(jump)
2.10 分割文件和数据(jump)
2.11 根据扩展名切分文件名
(1)将文件名称从“名陈.扩展名”中提取出来
借助`%`操作符
eg. 从`sample.jpg`中提取`sample`
```bash
$ file_jpg="sample.jpg"
$ name=${file_jpg%.*}
$ echo $name
```
(2)将扩展名提取出来
借助`#`操作符
```bash
$ extension=${file_jpg#*.}
$ echo $extension
```


[1]: https://book.douban.com/subject/6889456/
