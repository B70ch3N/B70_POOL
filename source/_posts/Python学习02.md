---
title: Python学习02
date: 2022-09-10 09:42:50
tags: Python
---

# Python学习02

## 写在前面

今天是农历8月15中秋节，先祝大家中秋快乐！线上开学迎来了第一个假期，就在昨天上完通软课后被拉进了一个比赛队伍，在课上实操和与同学交流过程中，我发现和大家相比还有很多不足，C和Python急需康复训练，所以接下来更新应该会加快，希望自己能尽快赶上来吧。

<!--more-->

在上一节中，简单记录了Python的安装、和一些基础知识，这次应该会记录一些个人认为比较重要的数据类型及其相关方法。

------

## Python的数据类型

### 1.列表

#### 1.1列表的基本性质

**列表**由一系列按特定顺序排列的元素组成，可以将任何东西加入列表中，其中的元素可以没有任何联系。在Python中用`[]`来表示列表，用`,`来对其中的元素进行分隔。

实例

```python
bicycles = ['trek', 'cannondale', 'redline']
print(bicycles)
```

输出

> ['trek', 'cannondale, 'redline']

可见打印列表会同时输出`[]`。

#### 1.2访问列表元素

对列表进行访问，有多种方式

实例

```python
bicycles = ['trek', 'cannondale', 'redline', 'giant']

# 正向访问
print(bicycles[0])
print(bicycles[1])
print(bicycles[2])

# 反向访问
print(bicycles[-1])
print(bicycles[-2])
print(bicycles[-3])

# 对列表进行切片
print(bicycles[0:2])
print(bicycles[-1:0])
print(bicycles[0:-1])
print(bicycles[0::2])
```

输出

> trek
> cannondale
> redline
> giant
> redline
> cannondale
> ['trek', 'cannondale']
> []
> ['trek', 'cannondale', 'redline']
> ['trek', 'redline']

如上述实例，当对列表进行正向访问时首元素下标为0，其余元素顺序后排；当对列表进行反向访问时，即从尾元素开始访问，其下标为-1，以此类推。当对列表进行切片时运算符的语法形式为[start：end：step]，start是开始索引 ，end是结束索引，step是步长，end值为空时，从start开始输出列表元素，直至末尾。具体使用方法如上述实例，但要注意，第二种切片方法并不正确。

#### 1.3对列表进行修改，添加和删除元素

##### 修改

只需访问对应元素，并将其赋予新的值即可，略。

##### 添加

可以使用方法`append()`，在列表末尾添加元素。

实例

```python
list1 = []
list1.append('baidu')
list1.append('google')
print(list1)
```

输出

> ['baidu', 'google']



可以使用方法`insert()`在列表任意位置添加元素。

实例

```python
list1 = ['baidu', 'google']
list1.insert(1, 'taobao')

print(list1)
```

输出

> ['baidu', 'taobao', 'google']



##### 删除

可以使用`del`语句来删除元素。

实例

```python
list1 = ['baidu', 'taobao', 'google']
del list1[1]
print(list1)
```

输出

> ['baidu', 'google']



可以使用`pop()`方法删除元素，效果类似于数据结构中弹出栈顶的pop函数，即弹出末尾元素。但是若赋予对应元素的下标，也同样会弹出对应元素。

实例

```python
list1 = ['baidu', 'taobao', 'google']
print(list1.pop())
print(list1)
```

输出

> google
> ['baidu', 'taobao']



可以使用`remove()`方法删除确定值的元素，若相同值的元素在列表中重复出现，仅会删除第一个值。

实例

```python
list1 = ['baidu', 'taobao', 'google']
list1.remove('taobao')
print(list1)
```

输出

> ['baidu', 'google']



#### 1.4列表脚本操作符

列表对 + 和 * 的操作符与字符串相似。+ 号用于组合列表，* 号用于重复列表。

如下所示：

| Python 表达式                         | 结果                         | 描述                 |
| :------------------------------------ | :--------------------------- | :------------------- |
| len([1, 2, 3])                        | 3                            | 长度                 |
| [1, 2, 3] + [4, 5, 6]                 | [1, 2, 3, 4, 5, 6]           | 组合                 |
| ['Hi!'] * 4                           | ['Hi!', 'Hi!', 'Hi!', 'Hi!'] | 重复                 |
| 3 in [1, 2, 3]                        | True                         | 元素是否存在于列表中 |
| for x in [1, 2, 3]: print(x, end=" ") | 1 2 3                        | 迭代                 |

#### 1.5嵌套列表

实例

```python
>>>a = ['a', 'b', 'c']
>>> n = [1, 2, 3]
>>> x = [a, n]
>>> x
[['a', 'b', 'c'], [1, 2, 3]]
>>> x[0]
['a', 'b', 'c']
>>> x[0][1]
'b'
```



#### 1.6列表函数&方法

Python包含以下函数:

| 序号 | 函数                                                         |
| :--- | :----------------------------------------------------------- |
| 1    | [len(list)](https://www.runoob.com/python3/python3-att-list-len.html) 列表元素个数 |
| 2    | [max(list)](https://www.runoob.com/python3/python3-att-list-max.html) 返回列表元素最大值 |
| 3    | [min(list)](https://www.runoob.com/python3/python3-att-list-min.html) 返回列表元素最小值 |
| 4    | [list(seq)](https://www.runoob.com/python3/python3-att-list-list.html) 将元组转换为列表 |

Python包含以下方法:

| 序号 | 方法                                                         |
| :--- | :----------------------------------------------------------- |
| 1    | [list.append(obj)](https://www.runoob.com/python3/python3-att-list-append.html) 在列表末尾添加新的对象 |
| 2    | [list.count(obj)](https://www.runoob.com/python3/python3-att-list-count.html) 统计某个元素在列表中出现的次数 |
| 3    | [list.extend(seq)](https://www.runoob.com/python3/python3-att-list-extend.html) 在列表末尾一次性追加另一个序列中的多个值（用新列表扩展原来的列表） |
| 4    | [list.index(obj)](https://www.runoob.com/python3/python3-att-list-index.html) 从列表中找出某个值第一个匹配项的索引位置 |
| 5    | [list.insert(index, obj)](https://www.runoob.com/python3/python3-att-list-insert.html) 将对象插入列表 |
| 6    | list.pop([index=-1])移除列表中的一个元素（默认最后一个元素），并且返回该元素的值 |
| 7    | [list.remove(obj)](https://www.runoob.com/python3/python3-att-list-remove.html) 移除列表中某个值的第一个匹配项 |
| 8    | [list.reverse()](https://www.runoob.com/python3/python3-att-list-reverse.html) 反向列表中元素 |
| 9    | [list.sort( key=None, reverse=False)](https://www.runoob.com/python3/python3-att-list-sort.html) 对原列表进行排序 |
| 10   | [list.clear()](https://www.runoob.com/python3/python3-att-list-clear.html) 清空列表 |
| 11   | [list.copy()](https://www.runoob.com/python3/python3-att-list-copy.html) 复制列表 |

### 2.元组

对于元组并不会作过多说明，它与列表类似，但一旦对元组进行赋值操作后，就无法修改。

#### 2.1元组的基本性质

**元组**是不可变的列表。

#### 2.2定义一个元组

实例

```python
zhangsan = s_id, s_name = (2022210222, '张三')
print(zhangsan, s_name)
```

输出

> (2022210222, '张三') 张三 

由实例可知为元组的一种较为复杂的应用。与列表不同，元组用`()`来定义一个元组，我们也可以用实例中的方式定义一个打包在一起的元组。当然也可以单个定义，例如`tup1 = ('baidu', 'taobao', 'google')`，但当元组中元素只有一个时，必须使用`tup1 = ('baidu', )`这种格式，即在元素末尾添加逗号以表明其为元组。



#### 2.3访问元组

关于访问元组与对元组进行切片，与列表类似，略。

#### 2.4修改元组

无法对元组内的元素进行修改，但可以重新定义整个元组也可以删除整个元组。

实例

```python
tup1 = ('baidu', 'taobao', 'google')
tup1 = ('JD',)
print(tup1)
```

输出

> ('JD',)

重新赋值的元组，实际上绑定到新的对象了，内存地址发生了变化，不是修改了原来的对象。

可以使用`del`语句删除整个元组，如`del tup1`。



#### 2.5元组运算符

与字符串一样，元组之间可以使用 **+** 号和 ***** 号进行运算。这就意味着他们可以组合和复制，运算后会生成一个新的元组。

| Python 表达式                                | 结果                         | 描述         |
| :------------------------------------------- | :--------------------------- | :----------- |
| `len((1, 2, 3))`                             | 3                            | 计算元素个数 |
| `(1, 2, 3) + (4, 5, 6)`                      | (1, 2, 3, 4, 5, 6)           | 连接         |
| `('Hi!',) * 4`                               | ('Hi!', 'Hi!', 'Hi!', 'Hi!') | 复制         |
| `3 in (1, 2, 3)`                             | True                         | 元素是否存在 |
| `for x in (1, 2, 3):     print (x, end=" ")` | 1 2 3                        | 迭代         |

#### 2.6元组函数&方法

Python元组包含了以下内置函数

| 序号 | 方法及描述                               | 实例                                                         |
| :--- | :--------------------------------------- | :----------------------------------------------------------- |
| 1    | len(tuple) 计算元组元素个数。            | `>>> tuple1 = ('Google', 'Runoob', 'Taobao') >>> len(tuple1) 3 >>> ` |
| 2    | max(tuple) 返回元组中元素最大值。        | `>>> tuple2 = ('5', '4', '8') >>> max(tuple2) '8' >>> `      |
| 3    | min(tuple) 返回元组中元素最小值。        | `>>> tuple2 = ('5', '4', '8') >>> min(tuple2) '4' >>> `      |
| 4    | tuple(iterable) 将可迭代系列转换为元组。 | `>>> list1= ['Google', 'Taobao', 'Runoob', 'Baidu'] >>> tuple1=tuple(list1) >>> tuple1 ('Google', 'Taobao', 'Runoob', 'Baidu')` |

### 3.字典

#### 3.1字典的基本性质

**字典**是一系列键值对。每个**键**都与一个值相关，可通过键来访问相关联的值。可以将Python中的任何对象用作字典中的值。将键值对放在`{}`中就可以表示一个字典。

```python
alien_0 = {'color': 'green', 'points': 5}
```

如上述代码就定义了一个字典。

在字典中可包含任意数量的键值对，当键值对较多时还可以用如下方法定义字典：

```python
favorite_languages = {
    'jen': 'python',
    'sarah': 'c',
    'edward': 'ruby',
    'phil': 'python',
}
```

注意在最后一个键值对后也要加上`,`。

字典的两点重要特性

- 不允许同一个键出现两次。创建时如果同一个键被赋值两次，后一个值会被记住。
- 键必须不可变，所以可以用数字，字符串或元组充当，而用列表就不行。

#### 3.2访问字典中的值

可以和列表与元组类似的方法访问。

实例

```python
alien_0 = {'color': 'green', 'points': 5}
print(alien_0['points'])
```

输出

> 5



也可以用方法`get()`来访问，使用`get()`可以避免因字典中不存在对应的键值对而报错。

实例

```python
alien_0 = {'color': 'green', }
print(alien_0.get('points'))
```

输出

> None

`get()`有两个参数，第一个即想要使用的键，第二个为未找到对应键时的提示信息，默认为None。



#### 3.3修改字典中的值

使用第一种访问字典中的值的方法，在赋予想要改成的值即可，略。

#### 3.4删除键值对

可以使用`del`语句将相应的键值对删除。

实例

```python
alien_0 = {'color': 'green', 'points': 5}
del alien_0['points']
print(alien_0)
```

输出

> {'color': 'green'}

#### 3.5遍历字典

```python
favorite_languages = {
    'jen': 'python',
    'sarah': 'c',
    'edward': 'ruby',
    'phil': 'python',
}
```

这是个字典，我们可以利用`items()`方法返回一个键值对列表，以此可以对字典进行遍历。

实例

```python
favorite_languages = {
    'jen': 'python',
    'sarah': 'c',
    'edward': 'ruby',
    'phil': 'python',
}

print(favorite_languages.items())

for name, language in favorite_languages.items():
    print('name:', name, 'language:', language)

```

输出

> dict_items([('jen', 'python'), ('sarah', 'c'), ('edward', 'ruby'), ('phil', 'python')])
> name: jen		language: python
> name: sarah	language: c
> name: edward language: ruby
> name: phil 	   language: python



可以使用key()方法返回一个键列表，以此可以对字典的键进行遍历。

实例

```python
favorite_languages = {
    'jen': 'python',
    'sarah': 'c',
    'edward': 'ruby',
    'phil': 'python',
}

print(favorite_languages.keys())

for name in favorite_languages.keys():
    print('name:', name)
```

输出

> dict_keys(['jen', 'sarah', 'edward', 'phil'])
> name: jen
> name: sarah
> name: edward
> name: phil

若不使用`key()`方法，在遍历字典时，默认遍历键，也就是说`key()`方法可以省略。



可以使用value()方法返回一个值列表，以此可以对字典的值进行遍历，略。

如果遇到含重复值的字典，我们可以使用set()方法创建一个集合。

实例

```python
favorite_languages = {
    'jen': 'python',
    'sarah': 'c',
    'edward': 'ruby',
    'phil': 'python',
}


for name in set(favorite_languages.values()):
    print('name:', name)
```

输出

> name: ruby
> name: c
> name: python

#### 3.6字典内置函数&方法

Python字典包含了以下内置函数：

| 序号 | 函数及描述                                                   | 实例                                                         |
| :--- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| 1    | len(dict) 计算字典元素个数，即键的总数。                     | `>>> tinydict = {'Name': 'Runoob', 'Age': 7, 'Class': 'First'} >>> len(tinydict) 3` |
| 2    | str(dict) 输出字典，可以打印的字符串表示。                   | `>>> tinydict = {'Name': 'Runoob', 'Age': 7, 'Class': 'First'} >>> str(tinydict) "{'Name': 'Runoob', 'Class': 'First', 'Age': 7}"` |
| 3    | type(variable) 返回输入的变量类型，如果变量是字典就返回字典类型。 | `>>> tinydict = {'Name': 'Runoob', 'Age': 7, 'Class': 'First'} >>> type(tinydict) <class 'dict'>` |

Python字典包含了以下内置方法：

| 序号 | 函数及描述                                                   |
| :--- | :----------------------------------------------------------- |
| 1    | [dict.clear()](https://www.runoob.com/python3/python3-att-dictionary-clear.html) 删除字典内所有元素 |
| 2    | [dict.copy()](https://www.runoob.com/python3/python3-att-dictionary-copy.html) 返回一个字典的浅复制 |
| 3    | [dict.fromkeys()](https://www.runoob.com/python3/python3-att-dictionary-fromkeys.html) 创建一个新字典，以序列seq中元素做字典的键，val为字典所有键对应的初始值 |
| 4    | [dict.get(key, default=None)](https://www.runoob.com/python3/python3-att-dictionary-get.html) 返回指定键的值，如果键不在字典中返回 default 设置的默认值 |
| 5    | [key in dict](https://www.runoob.com/python3/python3-att-dictionary-in.html) 如果键在字典dict里返回true，否则返回false |
| 6    | [dict.items()](https://www.runoob.com/python3/python3-att-dictionary-items.html) 以列表返回一个视图对象 |
| 7    | [dict.keys()](https://www.runoob.com/python3/python3-att-dictionary-keys.html) 返回一个视图对象 |
| 8    | [dict.setdefault(key, default=None)](https://www.runoob.com/python3/python3-att-dictionary-setdefault.html) 和get()类似, 但如果键不存在于字典中，将会添加键并将值设为default |
| 9    | [dict.update(dict2)](https://www.runoob.com/python3/python3-att-dictionary-update.html) 把字典dict2的键/值对更新到dict里 |
| 10   | [dict.values()](https://www.runoob.com/python3/python3-att-dictionary-values.html) 返回一个视图对象 |
| 11   | pop(key,default) 删除字典 key（键）所对应的值，返回被删除的值。 |
| 12   | [popitem()](https://www.runoob.com/python3/python3-att-dictionary-popitem.html) 返回并删除字典中的最后一对键和值。 |



<img src="Python学习02\001.jpg" style="zoom:80%;" />



写了一天，写不动了，还有没涉及到的内容以后再聊，也可以参考下面这些资料

参考资料：

书籍：《Python编程从入门到实践》

[Python3菜鸟教程](https://www.runoob.com/python3/python3-tutorial.html)

[一些培训资料](https://www.aliyundrive.com/s/iMxgt5vZmRR) 提取码: a89g

集合可以参考[菜鸟教程Python3 集合](https://www.runoob.com/python3/python3-set.html)。

字典是可以嵌套的，但鉴于本人能力有限，不再展开，可以在[这里](https://www.jb51.net/article/229229.htm#_lab2_0_0)进行学习参考。
