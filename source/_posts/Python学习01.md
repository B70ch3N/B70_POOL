---
title: Python学习01
date: 2022-09-07 09:11:07
tags: Python
---

# Python学习01

## 写在前面

在2021学年第二学期期末，我参加的学校组织的软件培训，Python学习系列文章用于记录和回顾学到的一些语法以及应用。

<!--more-->

系列文章中所指的Python均为Python3，Python3与Python2在某些部分有较大的不同，还请注意。

------



## Python的一些重要特性

Python（下文Py同）与C语言不同，它是一种解释性语言，没有编译的过程。解释就是将源代码逐条转换成目标代码并逐条运行的过程，也就是说每次程序运行时都要边翻译边执行（C语言类有编译器的语言只需要转换一次，再次运行时就不需要转换）。

Python有两种编程方式：交互式与文件式。此处不过多展开，

------



## Windows上的Python3环境搭建

如果你只需要Python纯净版来练习，或有较高的计算机水平可以在Python官网下载。

Python官网：https://www.python.org/	

但本人并不推荐下载最新版本的Python，有许多Python第三方模块不支持最新版本。

当然你也可以选择下载anaconda（相当于Py的大整合包），里面自带了许多常用模块。

anaconda下载地址：https://www.anaconda.com/products/distribution

anaconda具有可视化界面，能够较为简易的管理Py环境，个人比较推荐。

安装过程不过多赘述，记得将Python添加进系统环境

<img src="Python学习01\001.png" style="zoom: 50%;" />

大致情况如上图

当你安装完Python后可以在WindowsPowerShell中输入`python`检查是否安装成功

<img src="Python学习01\002.png" style="zoom: 33%;" />

如图即安装成功

集成开发环境本人选择的是Pycharm社区版，有中文，可检查语法，当然你也可以选择其他开发环境。

------



## Python的一些基础语法

Python是一门面向对象的语言，一些语法和C++等比较类似，有相关语言基础的朋友，即使只学过C语言这种面向过程的语言，都可以很快上手。

### 编码

默认情况下，Python使用UTF-8编码，其字符串都是unicode字符串，当然，你可以指定使用的编码

```python
# -*- coding: cp-1252 -*-
```

上述定义允许在源文件中使用Windows-1252 字符集中的字符编码。

### 标识符

标识符命名规则

- 第一个字符必须是字母表中的字母或下划线`_`
- 标识符大小写敏感

当然了，Python支持用中文作为变量名，但基于通用性考虑，并不推荐。

### 保留字

保留字即关键字，你可以在python控制台中查看当前版本的保留字。

```python
>>> import keyword
>>> keyword.kwlist
['False', 'None', 'True', '__peg_parser__', 'and', 'as', 'assert', 'async', 'await', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']
```

### 注释

单行注释可用`#`开头。

多行注释可用`'''`和`"""`作为开头与结尾。

实例

```python
#注释一
#注释二

"""
多
行
注
释
"""

'''
也是
多行
注释
'''

print('test')
```

输出

> test

### 行与缩进

python最具特色的一点就是使用缩进表示代码块，不需要使用`{}`

缩进的空格数在同一代码块中必须统一，否则将会报错。

实例

```python
#正确的格式
if True:
    print("True")
else:
    print("False")
```

### 多行语句

当一行代码过长可以使用`\`实现多行语句。

实例

```python
total = item_one + \
        item_two + \
        item_three
```

而在`()`,`[]`,`{}`中就不需要使用`\`。

实例

```python
total = ['item_one', 'item_two', 
         'item_three']
```

### 数字类型

- int(整数)，如1，在python3中只有一种整数类型。
- bool(布尔)，即True，False
- float(浮点数)，如1.23、3E-2
- complex(负数)，如1 + 2j

### 字符串

- `'`与`"`使用方法相同可灵活使用。
- `'''`或`"""`可以指定多行字符串。
- 在字符串前使用`r`可以让转义符不发生转义如`r"test \n"`则\n会显示，并不会换行。
- 可用`+`对字符串进行连接，`*`可让字符串重复
- 字符串有两种索引方式，从左往右从`0`开始，从有往左从`-1`开始。
- Python中的字符串不能改变。
- Python中没有字符类型，一个字符就是长度为1的字符串。
- 字符串的截取格式：变量[头下标:尾下标:步长]

实例

```python
str = '123456789'

print(str)  # 输出字符串
print(str[0:-1])  # 输出第一个到倒数第二个的所有字符
print(str[0])  # 输出字符串第一个字符
print(str[2:5])  # 输出从第三个开始到第五个的字符
print(str[2:])  # 输出从第三个开始后的所有字符
print(str[1:5:2])  # 输出从第二个开始到第五个且每隔一个的字符（步长为2）
print(str * 2)  # 输出字符串两次
print(str + '你好')  # 连接字符串


print('hi\nbro')  # 使用反斜杠\n转义特殊字符
print(r'hi\nbro')  # 在字符串前面添加一个r，表示原始字符串，不会发生转义
```

输出

> 123456789
> 12345678
> 1
> 345
> 3456789
> 24
> 123456789123456789
> 123456789你好
> hi
> bro
> hi\nbro

### print输出函数

print输出默认换行，如果要实现不换行，需要让print参数end的值为空。

实例

```python
x = "a"
y = "b"
# 换行输出
print(x)
print(y)

# 不换行输出
print(x, end="")
print(y, end="")
```

输出

> a
> b
> ab

当然你也可以给end赋予不同的值来达到不同的分割效果。

### input输入函数

input函数括号内可以写输入提示，当不赋值时也可以作为程序中断。

实例

```python
a = input("请输入内容：")
print(a)
input("按回车结束程序")
```

输出

> 请输入内容：啦啦啦
> 啦啦啦
> 按回车结束程序
>
> 进程已结束,退出代码0



参考资料：

[Python3菜鸟教程](https://www.runoob.com/python3/python3-tutorial.html)

[一些培训资料](https://www.aliyundrive.com/s/iMxgt5vZmRR) 提取码: a89g
