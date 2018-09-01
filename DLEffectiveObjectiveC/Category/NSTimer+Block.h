//
//  NSTimer+Block.h
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/9/1.
//  Copyright © 2018年 David. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Block)

+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repeats:(BOOL)repeats;

@end
