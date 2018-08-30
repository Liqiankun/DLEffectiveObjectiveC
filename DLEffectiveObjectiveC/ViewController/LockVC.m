//
//  LockVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/27.
//  Copyright © 2018年 David. All rights reserved.
//

#import "LockVC.h"

@interface LockVC ()
{
    NSLock *_lock;
    dispatch_queue_t _syncQueue;
    NSString *_string;
    NSString *_lock_string;
    NSString *_gcd_string;
}

@end

@implementation LockVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    _lock = [[NSLock alloc] init];
    _syncQueue = dispatch_queue_create("com.davidlee.syncQueue", NULL);
    
    dispatch_queue_t curQueue = dispatch_queue_create("com.davidlee.curqueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_barrier_async(curQueue, ^{
        NSLog(@"dispatch_barrier_async");
    });
    
    dispatch_async(curQueue, ^{
        self.gcd_string = @"gcd_string";
        NSLog(@"self.gcd_string - %@", self.gcd_string);
    });
    
    dispatch_async(curQueue, ^{
        self.gcd_string = @"gcd_string";
        NSLog(@"self.gcd_string - %@", self.gcd_string);
    });
    
    dispatch_async(curQueue, ^{
        self.gcd_string = @"gcd_string";
        NSLog(@"self.gcd_string - %@", self.gcd_string);
    });
    
    dispatch_async(curQueue, ^{
        self.gcd_string = @"gcd_string";
        NSLog(@"self.gcd_string - %@", self.gcd_string);
    });
    
}

-(NSString *)string {
    @synchronized(self){
        return _string;
    }
}

-(void)setString:(NSString *)string {
    @synchronized(self){
        _string = string;
    }
}

-(NSString *)lock_string {
    return _lock_string;
}

-(void)setLock_string:(NSString *)lock_string {
    [_lock lock];
    _lock_string = lock_string;
    [_lock unlock];
}

-(NSString *)gcd_string {
    __block NSString *blockString;
    dispatch_sync(_syncQueue, ^{
        blockString = self->_gcd_string;
    });
    return blockString;
}

-(void)setGcd_string:(NSString *)gcd_string {
    dispatch_barrier_async(_syncQueue, ^{
        self->_gcd_string = gcd_string;
    });
}

-(void)dealloc {
    NSLog(@"LockVC dealloc");
}

@end
