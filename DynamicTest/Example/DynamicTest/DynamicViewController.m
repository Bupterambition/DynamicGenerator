//
//  DynamicViewController.m
//  DynamicTest
//
//  Created by senmiao on 11/25/2016.
//  Copyright (c) 2016 senmiao. All rights reserved.
//

#import "DynamicViewController.h"
#import <DynamicTest/DynamicRequire.h>

@interface DynamicViewController ()

@end

@implementation DynamicViewController

#if DEBUG

- (void)injected {
    [self viewDidLoad];
}

#endif

- (void)viewDidLoad
{
    [super viewDidLoad];
    [DynamicRequire loadDynamicLib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
