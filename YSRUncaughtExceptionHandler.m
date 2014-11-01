
#import "YSRUncaughtExceptionHandler.h"

NSString *applicationDocumentsDirectory() {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

void UncaughtExceptionHandler(NSException *exception) {
    NSArray *arr = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSString *msg = [NSString stringWithFormat:@"\n=============异常崩溃报告=============\ntime:%@\nname:%@\nreason:%@\ncallStackSymbols:\n%@",[[NSDate date] descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"zh-Hans"]],name,reason,[arr componentsJoinedByString:@"\n"]];
    
    NSInteger catchStyle = CustomYSRCrashCatchStyle;
    
    //写文件
    if (catchStyle & 0x01) {
        NSString *path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
        NSFileManager *manager = [NSFileManager defaultManager];
        if (![manager fileExistsAtPath:path]) {
            [manager createFileAtPath:path contents:nil attributes:nil];
        }
        NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:path];
        [handle seekToEndOfFile];
        [handle writeData:[msg dataUsingEncoding:NSUTF8StringEncoding]];
        [handle closeFile];
    }
    
    //发送邮件
    if (catchStyle & 0x02) {
        NSMutableString *subject = [NSMutableString stringWithFormat:@"mailto://%@?主题=Bug report&body=",CustomYSREmail];
        [subject appendString:msg];
        NSURL *url = [NSURL URLWithString:[subject stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@implementation YSRUncaughtExceptionHandler

+ (void)setDefaultUncaughtExceptionHandler {
    NSSetUncaughtExceptionHandler (&UncaughtExceptionHandler);
}

@end
