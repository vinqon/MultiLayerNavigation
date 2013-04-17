#MultiLayerNavigation

##介绍 / Introduction

MultiLayerNavigation可以让你轻易地实现类似网易新闻/新浪微博滑动返回的交互效果；
你唯一需要做的就是把UINavigationController替换为MLNavigationController，或者继承它；
另外，如果在你的ViewController里面有UIScrollView，请把它替换为MLScrollView，以便触摸事件可以顺利传递到NavgationController中。
同样的，我们也提供了MLTableView用于扩展UITableView；

MultiLayerNavigation helps you implemntation the interaction -- 'drag to back' in a easy way.
The only one thing you need to do is replacing your UINavigationController with the MLNavigation Controller or inheriting it. 
In addtion, if there are a UIScrollView in your ViewController, you need to do one more thing -- replace the UIScrollView with MLScrollView or inherit it, so does MLTableView.

![Demo](http://code4app.qiniudn.com/photo/516ce1f76803fa5034000001_12.png)


##已知问题
1. 尚未完全支持所有可滚动的view(UIWebView/UITextView);
2. 只能使用push/pop系列方法来切换viewcontroller,不能直接调用setViewControllers设置;

##Known Issues
1. NOT fully support all scrollable view (UIWebView/UITextView) yet;
2. NOT support using setViewControllers method to swicth viewcontroller.


