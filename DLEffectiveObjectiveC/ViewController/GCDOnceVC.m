//
//  GCDOnceVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/9/1.
//  Copyright © 2018年 David. All rights reserved.
//

#import "GCDOnceVC.h"
#import "Singleton.h"

@interface GCDOnceVC ()

@end

@implementation GCDOnceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Singleton *one = [Singleton shareInstance];
    Singleton *two = [Singleton shareInstance];
    
    NSLog(@"one - %p, two - %p", one, two);
}

@end
