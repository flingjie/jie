;;;;;
title: Ruby元编程 思维导图6(编写代码的代码)
tags: ruby, mindmap
date: 2014-05-03 19:23:53
format: md
;;;;;

根本没有什么元编程，只有编程！？
<br>
{% img /static/img/CodeWriter.png %}
<br>

* 注1: 由于代码字符串和块非常相似，因此，在很多情况下，可以选择使用任
  意一种。但是，一般情况下，只要能用块就尽量用块。
  
* 注2: 使一个模块可以通过钩子方法扩展它的包含者。

``` ruby
module M
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def my_method
      'a class method'
    end
  end
end

class C
  include M
end

C.my_method   # =>  "a class method"
```
