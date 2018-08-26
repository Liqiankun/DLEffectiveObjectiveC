//
//  Rectangle.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

-(instancetype)init {
    return [self initWithWidth:5.0 andHeight:5.0];
}

//-(instancetype)init {
//    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Must use initWithWidth:andHeight: instead" userInfo:nil];
//}

-(instancetype)initWithWidth:(float)width andHeight:(float)height {
    if (self = [super init]) {
        _height = height;
        _width = width;
    }
    return self;
}

@end
