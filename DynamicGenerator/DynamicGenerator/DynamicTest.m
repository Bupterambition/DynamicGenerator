//
//  DynamicTest.m
//  DynamicGenerator
//
//  Created by Senmiao on 2016/11/25.
//  Copyright © 2016年 Senmiao. All rights reserved.
//

#import "DynamicTest.h"
#import <UIKit/UIKit.h>
@implementation DynamicTest
- (void)showDynamicAlertView {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Dynamic" message:@"Github Test" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    [alert show];
}
@end
