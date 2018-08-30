//
//  GCDGroupVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/29.
//  Copyright © 2018年 David. All rights reserved.
//

#import "GCDGroupVC.h"

@interface GCDGroupVC ()

@end

@implementation GCDGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("group_queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async 1");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async 2");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async 3");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async 4");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"dispatch_group_async 5");
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"dispatch_group_async finished");
    });
    
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    NSLog(@"dispatch_group_async finished");
    
    
    dispatch_apply(10, queue, ^(size_t i) {
        NSLog(@"dispatch_apply");
    });
    
    NSLog(@"all finished");
    
}


@end
