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
