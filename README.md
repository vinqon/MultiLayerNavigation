#MultiLayerNavigation

##介绍 / Introduction

MultiLayerNavigation可以让你轻易地实现类似网易新闻/新浪微博滑动返回的交互效果；  
你唯一需要做的就是把UINavigationController替换为MLNavigationController，或者继承它；  

MultiLayerNavigation helps you implemntation the interaction -- 'drag to back' in a easy way.  
The only one thing you need to do is replacing your UINavigationController with the MLNavigation Controller or inheriting it.   

![Demo](http://code4app.qiniudn.com/photo/516ce1f76803fa5034000001_12.png)


##已知问题
1. 只能使用push/pop系列方法来切换viewcontroller,不能直接调用setViewControllers设置;

##Known Issues
1. NOT support using setViewControllers method to swicth viewcontroller.


