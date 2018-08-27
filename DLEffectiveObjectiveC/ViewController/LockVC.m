//
//  LockVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/27.
//  Copyright © 2018年 David. All rights reserved.
//

#import "LockVC.h"

@interface LockVC () {
    NSLock *_lock;
    dispatch_queue_t _syncQueue;
}

@end

@implementation LockVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    _lock = [[NSLock alloc] init];
    _syncQueue = dispatch_queue_create("com.davidlee.syncQueue", NULL);
    
    dispatch_queue_t curQueue = dispatch_queue_create("com.davidlee.curqueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(curQueue, ^{
        [self synchronizedMethod];
    });
    
    dispatch_async(curQueue, ^{
        [self synchronizedMethod];
    });
    
    dispatch_async(curQueue, ^{
        [self synchronizedMethod];
    });
    
}

-(void)synchronizedMethod {
    @synchronized(self){
        NSLog(@"synchronizedMethod");
    }
}


-(void)lock_synchronizedMethod {
    [_lock lock];
    NSLog(@"lock_synchronizedMethod");
    [_lock unlock];
}


-(void)gcd_synchronizedMethod {
    dispatch_sync(_syncQueue, ^{
        NSLog(@"gcd_synchronizedMethod");
    });
}


@end
