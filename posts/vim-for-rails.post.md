;;;;;
title: 配置VIM for Rails
tags: vim, rails
date: 2014-05-27 01:35:30 
format: md
;;;;;

使用vim来进行Rails开发，对配置过程略做记录，前提vim已安装完毕。   
1、 **安装pathogen**   
pathogens是vim的插件管理工具，可简化对vim插件的管理。   
安装如下：

``` text
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -LSso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim;
```
然后在`.vimrc`中加入：

``` text
execute pathogen#infect()
" 加在下列配置之前
syntax on
filetype plugin indent on
```

2、 **rails.vim**   
rails插件，无需多介绍。   
常用快捷键:

``` text
gf           =>  跳转到定义
ctrl+6       =>  返回上一文件

```

常用命令：

``` ruby

# 查找文件
:Rfind routes.rb

# 打开model
:Rmodel user

# 打开controller
:Rcontroller users
:Rcont users

# 打开view
:Rview user/index
:Rview user/_user

# 启动server
:Rserver
# 关闭server
:Rserver! -

# 打开js文件
:Rjavascript js_name
```

**注**:其`Rtag`命令使用的是`exuberant-ctags`中的`ctags`，安装Emacs后也会安装一个`ctag`工具，会与之冲突，可以将Emacs的`ctags`重命名后安装`exuberant-ctags`解决之。

3、 **nerdtree**   
显示目录树，命令`:NERDTree`显示目录。   

4、 **vim-surround**   
方便输入括号等的插件，使用`ctrl+g s =`，即可插入`<%=  %>`。   

5、 **sparkup**   
html编写插件，输入`div#header`，然后按`ctrl+e`，就会扩展为
`<div id="header"></div>`。

6、 **snipmate**   
代码片段补全

7、 **neocomplcache**   
代码补全提示

8、 **auto-pairs**   
括号自动补全

