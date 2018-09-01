//
//  BridgeVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/9/1.
//  Copyright © 2018年 David. All rights reserved.
//

#import "BridgeVC.h"
#import <CoreFoundation/CoreFoundation.h>
@interface BridgeVC ()

@end

@implementation BridgeVC

const void* RetainCallBack(CFAllocatorRef allocator, const void *value) {
    return CFRetain(value);
}

void ReleaseCallBack(CFAllocatorRef allocator, const void *value) {
    CFRelease(value);
}

CFDictionaryKeyCallBacks keyCallBacks = {
    0,
    RetainCallBack,
    ReleaseCallBack,
    NULL,
    CFEqual,
    CFHash,
};

CFDictionaryValueCallBacks valueCallBacks = {
    0,
    RetainCallBack,
    ReleaseCallBack,
    NULL,
    CFEqual
};


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array  = @[@1, @2, @3];
    CFArrayRef CFArray  = (__bridge CFArrayRef)array;
    NSLog(@"Size of array - %li", CFArrayGetCount(CFArray));
    
    CFMutableDictionaryRef CFDictionary = CFDictionaryCreateMutable(NULL, 0, &keyCallBacks, &valueCallBacks);
    NSMutableDictionary *dictionary = (__bridge_transfer NSMutableDictionary*)CFDictionary;
    NSLog(@"%@", dictionary);
    
}

@end
