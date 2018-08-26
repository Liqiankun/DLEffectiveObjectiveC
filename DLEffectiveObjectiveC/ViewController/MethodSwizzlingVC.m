//
//  MethodSwizzlingVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "MethodSwizzlingVC.h"
#import <objc/runtime.h>
#import "NSString+MyAdditions.h"

@interface MethodSwizzlingVC ()

@end

@implementation MethodSwizzlingVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    Method originalMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method swappedMethod = class_getInstanceMethod([NSString class], @selector(_myLowercaseString));
    
    method_exchangeImplementations(originalMethod, swappedMethod);
    
    NSString *string = @"Hello, This is David";
    
    NSString *lowercaseString = [string _myLowercaseString];
    NSLog(@"lowercaseString - %@", lowercaseString);
    
    NSString *uppercaseString  = [string uppercaseString];
    NSLog(@"uppercaseStirng - %@", uppercaseString);

}


@end
