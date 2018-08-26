//
//  Person.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName {
    if (self = [super init]) {
        _firstName = firstName;
        _lastName = lastName;
    }
    return self;
}

@end
