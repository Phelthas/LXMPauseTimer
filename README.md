# LXMPauseTimer
A category that could pause and continue a NSTimer with accurate time interval    


NSTimer没有暂停功能，想让它暂停只能将其fireDate设置为`[NSDate distantFuture]`    
但是想让它继续就麻烦了，只能新设置一个fireDate，但是这个新的fireDate应该设置为什么时候呢？    
如果设置为`[NSDate date]`，那它立即就会执行timer对应的selector；    
如果设置为原来的fireDate（需要提前保存），那这个fireDate可能已经过去了，导致selector一直不会被执行；    
如果设置为`[NSDate date] + 预设间隔`，那可能会出现比如：间隔10秒，在第9秒暂停，那暂停回来，需要再等10秒才会执行selector而不是1秒；    

这个分类就是为了解决以上的问题    
其原理很简单，就是用分类保存下按下暂停的那个时间点的时间`pauseStartDate`和原来的fireDate `originalFireDate`  
然后按下继续按钮时，算出离`pauseStartDate`过了多久，把这个时间间隔加到`originalFireDate`上算出准确的fireDate赋值给timer    
完成~

用处不是特别的广泛，但是有的时候需求比较奇葩只能这么玩，所以还是封装一下留着，说不定以后还用的上呢~


## How to use
1，将`NSTimer+LXMPause.h`和 `NSTimer+LXMPause.m` 拖到你的工程中    
2，在需要的地方 `#import "NSTimer+LXMPause.h"`    
3, 调用 `lxm_pause` or `lxm_continue` 方法    

#License
LXMPauseTimer is provided under the MIT license. See LICENSE file for details.
