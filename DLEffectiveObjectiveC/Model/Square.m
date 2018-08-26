//
//  Square.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "Square.h"

@implementation Square

-(instancetype)initWithDimension:(float)dismension {
    return [super initWithWidth:dismension andHeight:dismension];
}

-(instancetype)initWithWidth:(float)width andHeight:(float)height {
    float dismension = MAX(width, height);
    return [self initWithDimension:dismension];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%f, %f", self.width, self.height];
}

-(NSString *)debugDescription {
    return [NSString stringWithFormat:@"<%@, %p, %@>", [self class], self, @{
                                                                             @"width": @(self.width),
                                                                             @"height": @(self.height)
                                                                             }];
}


@end
