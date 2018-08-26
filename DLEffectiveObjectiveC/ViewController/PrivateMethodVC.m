//
//  PrivateMethodVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "PrivateMethodVC.h"
#import "PrivateMethod.h"

@interface PrivateMethodVC ()

@end

@implementation PrivateMethodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    PrivateMethod *method = [[PrivateMethod alloc] init];
    [method publicMethod];
}


@end
