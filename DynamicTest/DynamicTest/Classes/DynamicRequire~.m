//
//  DynamicRequire.m
//  Pods
//
//  Created by Senmiao on 2016/11/25.
//
//

#import "DynamicRequire.h"
#import <SSZipArchive/SSZipArchive.h>

@implementation DynamicRequire

+ (void)loadDynamicLib {
    [self downloadFramework];
}
/**
 *  加载动态链接库
 */
+ (void)downloadFramework {
    NSURL *url = [NSURL URLWithString:@"http://gitlab.mogujie.org/senmiao/DynamicTest/raw/master/DynamicGenerator/DynamicGenerator.framework.zip"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask * task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSFileManager *fileManageer = [NSFileManager defaultManager];
        NSString *documentsPath = [NSString stringWithFormat:@"%@/Documents/DynamicGenerator.framework",NSHomeDirectory()];
        [fileManageer removeItemAtPath:documentsPath error:nil];
        if ([fileManageer fileExistsAtPath:[location relativePath]]) {
            BOOL suc = [SSZipArchive unzipFileAtPath:[location relativePath] toDestination:[NSString stringWithFormat:@"%@/Documents/",NSHomeDirectory()]];
            if (suc) {
                NSLog(@"解压成功");
                [self bundleLoadDylibWithPath:documentsPath];
                Class rootClass = NSClassFromString(@"DynamicTest");
                id object = [[rootClass alloc] init];
                if (object) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
                    [object performSelector:@selector(showDynamicAlertView)];
#pragma clang diagnostic pop
                }
            }
        }
        
    }];
    [task resume];
}

+ (void)bundleLoadDylibWithPath:(NSString *)path
{
    NSError *err = nil;
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    if ([bundle loadAndReturnError:&err]) {
        NSLog(@"bundle load framework success.");
    } else {
        NSLog(@"bundle load framework err:%@",err);
    }
}
@end
