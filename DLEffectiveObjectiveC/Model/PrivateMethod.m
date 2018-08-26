//
//  PrivateMethod.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "PrivateMethod.h"

@interface PrivateMethod ()
@end

@implementation PrivateMethod

-(void)publicMethod {
    [self p_privateMethod];
}

-(void)p_privateMethod {
    NSLog(@"p_privateMethod");
}


@end
