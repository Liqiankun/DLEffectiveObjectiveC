//
//  EnumerationVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/9/1.
//  Copyright © 2018年 David. All rights reserved.
//

#import "EnumerationVC.h"

@interface EnumerationVC ()

@end

@implementation EnumerationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self forMethod];
    [self NSEnumeratorMethod];
    [self forInMethod];
    [self blockMethod];
    
}

-(void)forMethod {
    NSArray *array = @[@1, @2, @3];
    for (int i = 0; i < array.count; i++) {
        NSLog(@"%@", array[i]);
    }
    
    NSDictionary *dictionary = @{@"one": @1, @"two": @2, @"three": @3};
    NSArray *allKeys = [dictionary allKeys];
    for (int i = 0; i < allKeys.count; i++) {
        id key = allKeys[i];
        NSLog(@"%@", dictionary[key]);
    }
    
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    NSArray *allObjects = [set allObjects];
    for (int i = 0; i < allObjects.count; i++) {
        NSLog(@"%@", allObjects[i]);
    }
}

-(void)NSEnumeratorMethod {
    NSArray *array = @[@1, @2, @3];
    NSEnumerator *arrayEnumerator = [array reverseObjectEnumerator];
    id object;
    while ((object = [arrayEnumerator nextObject]) != nil) {
       NSLog(@"%@", object);
    }
    
    NSDictionary *dictionary = @{@"one": @1, @"two": @2, @"three": @3};
    NSEnumerator *dictionaryEnumerator = [dictionary keyEnumerator];
    id key;
    while ((key = [dictionaryEnumerator nextObject]) != nil) {
        NSLog(@"%@", dictionary[key]);
    }
    
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    NSEnumerator *setEnumerator = [set objectEnumerator];
    id setObject;
    while ((setObject = [setEnumerator nextObject]) != nil) {
        NSLog(@"%@", setObject);
    }
}

-(void)forInMethod {
    NSArray *array = @[@1, @2, @3];
    for (id object in [array reverseObjectEnumerator]) {
        NSLog(@"%@", object);
    }
    
    NSDictionary *dictionary = @{@"one": @1, @"two": @2, @"three": @3};
    for (id key in dictionary) {
        NSLog(@"%@", dictionary[key]);
    }
    
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    for (id object in set) {
        NSLog(@"%@", object);
    }
}

-(void)blockMethod {
    NSArray *array = @[@1, @2, @3];
    [array enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@", obj);
        if ([obj isEqualToNumber: @1]) {
            *stop = YES;
        }
    }];
    
    [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@", obj);
    }];
    
    NSDictionary *dictionary = @{@"one": @1, @"two": @2, @"three": @3};
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@", obj);
    }];
    
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@", obj);
    }];

}


@end
