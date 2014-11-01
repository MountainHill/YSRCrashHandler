##YSRCrashHandler是什么?
一个捕获程序异常的工具类

##YSRCrashHandler使用方法

```
#import "YSRUncaughtExceptionHandler"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [YSRUncaughtExceptionHandler setDefaultUncaughtExceptionHandler];
    return YES;
}
```

##YSRCrashHandler常用设置

* 设置YSRUncaughtExceptionHandler.h文件中宏变量CustomYSRCrashCatchStyle,可定义变量为YSRStyleWriteToFile,YSRStyleSendToEmail,或者(YSRStyleWriteToFile | YSRStyleSendToEmail),当前默认方式为(YSRStyleWriteToFile | YSRStyleSendToEmail)。目前仅支持纪录至Exception.txt文件和发送至邮箱。如需查看Exception.txt,需要设置工程Info.plist文件中添加row,key为“Application supports iTunes file sharing”，value为"YES".如果是真机调试可将机器连接itune查看程序文件，如果是模拟器调试，可至相应目录查找。
* 如果宏变量CustomYSRCrashCatchStyle中包含YSRStyleSendToEmail,可设置宏变量CustomYSREmail为自己的邮箱地址。如果宏变量CustomYSRCrashCatchStyle中不包含YSRStyleSendToEmail,可设置宏变量CustomYSREmail为@""。

##有问题反馈
在使用中有任何问题，欢迎反馈给我，可以用以下联系方式跟我交流

* 邮件(630964507#qq.com, 把#换成@)
* QQ: 630964507

##感激

* MaHua(http://mahua.jser.me) 