---
title: ChatGPT注册及ChatGPT QQ机器人部署教程
date: 2023-03-03 21:40:36
tags: AI
---

## 写在前面

ChatGPT（全名：Chat Generative Pre-trained Transformer）是由美国 OpenAI 研发的聊天机器人程序，于2022年11月30日发布。它是人工智能技术驱动的自然语言处理工具，它能够通过理解和学习人类的语言来进行对话，还能根据聊天的上下文进行互动，真正像人类一样来聊天交流，甚至能完成撰写邮件、视频脚本、文案、翻译、代码，写论文等任务。

虽然ChatGPT功能很强大，但由于种种原因，ChatGPT的注册过程有些许麻烦，希望本篇教程能够帮助到你。

<!--more-->

## 准备工具

必要准备

- 大陆和香港地区以外的手机号
- 电子邮箱

可能会用到的工具

- 科学上网的魔法

## 注册流程

### 一、获取大陆和香港地区以外的手机号

想要获取大陆和香港地区以外的手机号，我们可以从易博通公众号购买获得，每个微信可购买五个手机号

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\01.png" style="zoom:50%;" />

关注公众号后选择“订购”，选择"订购英国手机号“或“订购美国手机号”

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\02.jpg" style="zoom:50%;" />

这里已英国手机号为例，第一行输入自己的手机号，第二行为促销码（选填），下面选择购买时长，选择完毕输入验证码，点击Confirm继续

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\03.png" style="zoom:50%;" />

选择你喜欢的电话号码，选择完毕点击Confirm

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\04.jpg" style="zoom:50%;" />

选择合适的支付方式点击Confirm,确认支付后你就拥有了用于接收短息的英国手机号！

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\05.jpg" style="zoom:50%;" />

想要续期可以在我的账户->套餐续期里支付

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\06.jpg" style="zoom:50%;" />

### 二、注册ChatGPT账号

注册地址：https://chat.openai.com/auth/login

选择Sign up

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\07.png" style="zoom:50%;" />



选择你喜欢的注册方式

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\08.png" style="zoom:50%;" />

在注册过程中如果无法正常打开网页，你可能需要一些魔法

在这里输入刚刚获得的手机号，就可以通过易博通公众号收到验证码

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\09.png" style="zoom:50%;" />

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\10.png" style="zoom:50%;" />

然后你就注册成功了！

### 三、部署接入ChatGPT的QQ机器人

项目地址https://github.com/lss233/chatgpt-mirai-qq-bot

下载地址https://github.com/lss233/chatgpt-mirai-qq-bot/releases

这里以Windows版为例，我架设在了腾讯云上

下载Windows快速部署包，并解压

运行初始化

运行完毕后你需要在打开的配置文件中修改红框中的东西

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\14.png" style="zoom:50%;" />

在之后的启动过程中如果出错，你可以尝试：

- 使用session_token进行登陆
- 使用魔法上网
- mirai报错可尝试删除mirai文件夹下的bots文件夹

先启动mirai

启动完成后以

> login 你的QQ号 你的QQ号密码 ANDROID_WATCH

格式来登陆

在登陆过程中若出现以下情况，请下载滑块[验证助手](https://pan.baidu.com/s/1TJkEPx36LcZ1YxhkWWeOpQ) 提取码：9n88

输入TxCaptchaHelper来获取请求码

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\11.png" style="zoom:50%;" />

在框中输入请求码，完成验证

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\15.png" style="zoom:50%;" />

再回到终端，完成验证，登陆成功

<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\13.png" style="zoom:50%;" />

最后运行“启动ChatGPT”，机器人启动成功！

### 四、一些题外话

- [一些奇妙的ChatGPT用法](https://github.com/PlexPt/awesome-chatgpt-prompts-zh/issues/12)



相关资源

- [ChatGPT 中文调教指南](https://github.com/PlexPt/awesome-chatgpt-prompts-zh)
- [可能很有用的插件](https://github.com/bigemon/ChatGPT-ToolBox)及[安装地址](https://greasyfork.org/zh-CN/scripts/456901-chatgpt%E5%8A%9F%E8%83%BD%E5%A2%9E%E5%BC%BA)
- [高效率 QQ 机器人支持库](https://github.com/mamoe/mirai)
- [ChatGPT QQ 聊天机器人](https://github.com/lss233/chatgpt-mirai-qq-bot)



请将ChatGPT用于合理合法用途！！！

请将ChatGPT用于合理合法用途！！！

请将ChatGPT用于合理合法用途！！！





<img src="ChatGPT注册及ChatGPT-QQ机器人部署教程\16.jpg" style="zoom:50%;" />
