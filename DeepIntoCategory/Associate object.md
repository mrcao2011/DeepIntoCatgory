Associated Objects（关联对象）或者叫作关联引用（Associative References）
是作为Objective-C 2.0 运行时功能被引入到 Mac OS X 10.6 Snow Leopard（及iOS4）系统。
与它相关在<objc/runtime.h>中有3个C函数，它们可以让对象在运行时关联任何值：

objc_setAssociatedObject
objc_getAssociatedObject
objc_removeAssociatedObjects

为什么这几个方法很有用呢？因为开发者可以通过它们在分类中给已存在的类中添加自定义属性。

设置/获取关联对象
    如nsstring+category文件

移除关联对象
    一个的方法是试图在某个时刻调用objc_removeAssociatedObjects()函数来移除关联对象，然而，根据苹果文档描述，你不大可能有需求要自己去调用：
    这个函数的主要目的是很容易的让对象恢复成它“原始状态”，你不应该使用它来移除关联的对象，因为它也会移除掉包括其他地方加入的全部的关联对象。
    所以一般你只需要通过调用objc_setAssociatedObject并传入nil值来清除关联值。

模式
添加私有变量来帮助实现细节 。
    当拓展一个内置类时，可能有必要跟踪一些额外的状态，这是关联对象最普遍的应用场景。
    例如：AFNetworking中在UIImageView的分类中使用关联对象来存储一个请求操作对象（operation object），用于异步的从远程获取图片。

添加公共属性来设置分类的特性 。
    有时候，通过添加一个属性让一个分类更加灵活，而不是作为函数参数。这种情况下，使用关联对象作为一个公开的属性是可接受的解决方案。
    还是拿前面AFNetworking的例子来说，UIImageView的分类中imageResponseSerializer属性允许图片视图随意的使用一个过滤器，
    或者在图片请求并缓存之前就可以修改它的渲染。

为KVO创建一个关联的观察者（observer）。
    当在一个分类中使用KVO的时候，推荐使用一个自定义的关联对象作为观察者，而不是对象自己观察自己。

反模式
在不必要的时候使用关联对象。
    使用视图时一个常见的情况是通过数据模型或一些复合的值来创建一个便利的方法设置填充字段或属性。如果这些值在后面不会再被使用到，最好就不要使用关联对象了。

使用关联对象来保存一个可以被推算出来的值。
    例如，有人可能想通过关联对象存储UITableViewCell上一个自定义accessoryView的引用，
    使用tableView:accessoryButtonTappedForRowWithIndexPath: 和 cellForRowAtIndexPath:即可以达到要求。

使用关联对象来代替X，其中X代表下面的一些项：
子类化             当使用继承比使用组合更合适的时候。
Target-Action     给响应者添加交互事件。
手势识别           当target-action模式不够用的时候。
代理              当事件可以委托给其他对象。
消息 & 消息中心     使用低耦合的方式来广播消息。

关联对象应该被当做最后的手段来使用（不得不用时才用），而不是为了寻求一个解决方案就行（事实上，分类本身就不应该是解决问题优先选择的工具）。