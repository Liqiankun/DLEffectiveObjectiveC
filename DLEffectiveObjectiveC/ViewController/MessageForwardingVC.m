//
//  MessageForwardingVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/23.
//  Copyright © 2018年 David. All rights reserved.
//

#import "MessageForwardingVC.h"
#import "AutoDictionary.h"
@interface MessageForwardingVC ()

@end

@implementation MessageForwardingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    AutoDictionary  *autoDic = [[AutoDictionary alloc] init];
    autoDic.string = @"David Lee";
    NSLog(@"autoDic String - %@", autoDic.string);
}

@end
