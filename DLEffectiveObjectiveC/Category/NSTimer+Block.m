//
//  NSTimer+Block.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/9/1.
//  Copyright © 2018年 David. All rights reserved.
//

#import "NSTimer+Block.h"

@implementation NSTimer (Block)

+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+(void)blockInvoke:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
