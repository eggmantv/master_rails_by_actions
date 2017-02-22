# Rails实战之B2C商城开发

Demo地址: http://rails5-b2c.eggman.tv

项目具体讲解请参考这里 **[Rails实战之B2C商城开发](http://eggman.tv/c/s-master-rails-by-actions)**

为了方便在每节课的代码间进行切换，该课程是通过git tag的方式来组织的，就是每节课对应一个git tag。

首先clone该项目

```shell
$git clone git@github.com:eggmantv/master_rails_by_actions.git
```

切换tag
```shell
$cd master_rails_by_actions

查看所有标签
$git tag
01
02
...

切换到第一节课的源码
$git checkout 01
```

©EGGMAN.TV 蛋人网

# 项目介绍
该项目主要是我们自己开发的用于教学目的一个开源项目，项目基于Rails 5，实现的功能就是传统的B2C电商平台中常用的功能，包括:

- 用户注册登录（支持手机验证码或者邮箱）
- 购物车
- 收货地址
- 订单
- 支付（集成了支付宝支付功能）
- 后台管理功能（涵盖商品管理，商品图片，一二级分类）
- 前台其他相关功能（比如商品搜索，分类页面，单品页，用户中心）
- RSpec单元测试

项目使用技术:

-  ruby 2.3
- rails 5
- mysql  

前台框架:

- bootstrap
- font-awesome  

涉及到的主要Gem:

- sorcery
- ancestry
- paperclip
- rest-client
- rspec

适用对象：

- ruby和rails的初学者
- 想从产品或者技术角度学习电商平台核心设计功能的同学

# 安装

Ruby和Ruby on Rails环境的安装请参考这里: [Ruby和Ruby on Rails开发环境搭建](https://eggman.tv/blogs/how-to-setup-your-ruby-on-rails-development-environment)
