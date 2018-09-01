//
//  TimerVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/9/1.
//  Copyright © 2018年 David. All rights reserved.
//

#import "TimerVC.h"
#import "NSTimer+Block.h"
@interface TimerVC () {
    NSTimer *_timer;
}

@end

@implementation TimerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 block:^{
        [weakSelf doSomething];
    } repeats:YES];
}

-(void)doSomething {
    NSLog(@"doSomething");
}

-(void)dealloc {
    [_timer invalidate];
}

@end
