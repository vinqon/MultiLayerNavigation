#MultiLayerNavigation

##介绍 / Introduction

MultiLayerNavigation可以让你轻易地实现类似网易新闻/新浪微博滑动返回的交互效果；  
你唯一需要做的就是把UINavigationController替换为MLNavigationController，或者继承它；  

MultiLayerNavigation helps you implemntation the interaction -- 'drag to go back' in a easy way.  
The only one thing you need to do is replacing your UINavigationController with the MLNavigation Controller or inheriting from it.   

![Demo](http://code4app.qiniudn.com/photo/516ce1f76803fa5034000001_12.png)


##TODO List

1.	兼容可纵向滚动的scrollView,包括tableview和textview等(done)
2.	兼容使用UITabBarController(done)
3.	当快照栈过多的时候转存至磁盘，防止占用过多内存
4.	兼容WebView


##已知问题
1. 只能使用push/pop系列方法来切换viewcontroller,不能直接调用setViewControllers设置;

##Known Issues
1. NOT support using setViewControllers method to make viewcontroller transition.



##License
MultiLayerNavigation is published under MIT License

	Copyright (c) 2013 Feather Chan (@vinqon)

	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
