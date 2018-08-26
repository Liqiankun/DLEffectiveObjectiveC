//
//  Person.h
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,copy, readonly) NSString *firstName;
@property (nonatomic,copy, readonly) NSString *lastName;
@property (nonatomic, strong ) NSArray *friends;

-(instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;

@end
