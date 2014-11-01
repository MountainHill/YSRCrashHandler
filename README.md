###YSRCrashHandler是什么?

一个捕获程序异常的工具类，目前支持存储文件，发送邮件。在YSRUncaughtExceptionHandler.h中更改相应宏变量的值设置处理方式。

###YSRCrashHandler使用方法

```
#import "YSRUncaughtExceptionHandler"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [YSRUncaughtExceptionHandler setDefaultUncaughtExceptionHandler];
    return YES;
}
```

###YSRCrashHandler常用设置

* 设置宏变量`CustomYSRCrashCatchStyle`
    * <span style="font-size:115%;color:#A52A2A">YSRStyleWriteToFile</span>
    * <span style="font-size:115%;color:#A52A2A">YSRStyleSendToEmail</span>
    * <span style="font-size:115%;color:#A52A2A">YSRStyleWriteToFile | YSRStyleSendToEmail</span>


* 查看Exception.txt,需要在工程Info.plist文件中添加row
    * <span style="font-size:115%;color:#A52A2A">key:Application supports iTunes file sharing</span>
    * <span style="font-size:115%;color:#A52A2A">value:YES</span>


* 设置宏变量`CustomYSREmail`
    * <span style="font-size:115%;color:#A52A2A">邮箱地址</span>
    * <span style="font-size:115%;color:#A52A2A">@" "</span>

###有问题反馈

在使用中有任何问题，欢迎反馈给我，可以用以下联系方式跟我交流

* 邮件(630964507@qq.com)
* QQ: 630964507

##感激

* [MaHua](http://mahua.jser.me) 