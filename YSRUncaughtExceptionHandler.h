
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YSRCrashCatchStyle) {
    YSRStyleWriteToFile = 1 << 0,
    YSRStyleSendToEmail = 1 << 1,
};

#define CustomYSRCrashCatchStyle   (YSRStyleWriteToFile | YSRStyleSendToEmail)
#define CustomYSREmail  @"630964507@qq.com"

@interface YSRUncaughtExceptionHandler : NSObject

+ (void)setDefaultUncaughtExceptionHandler;

@end