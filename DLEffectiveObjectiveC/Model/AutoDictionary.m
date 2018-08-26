//
//  AutoDictionary.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/23.
//  Copyright © 2018年 David. All rights reserved.
//

#import "AutoDictionary.h"
#import <objc/runtime.h>

@interface AutoDictionary ()

@property (nonatomic, strong) NSMutableDictionary *backingStore;

@end

@implementation AutoDictionary

@dynamic string, number;

id autoDictionaryGetter(id self, SEL _cmd) {
    AutoDictionary *typedSelf  = (AutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    NSString *key = NSStringFromSelector(_cmd);
    return [backingStore objectForKey:key];
}

void autoDictionarySetter(id self, SEL _cmd, id value) {
    AutoDictionary *typedSelf = (AutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    
    NSString *selectorString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selectorString mutableCopy];
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    NSString *lowerCaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowerCaseFirstChar];
    
    if (value) {
        [backingStore setObject:value forKey:key];
    } else {
        [backingStore removeObjectForKey:key];
    }
}

-(instancetype)init {
    if (self = [super init]) {
        _backingStore = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+(BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
        return YES;
    } else {
        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
