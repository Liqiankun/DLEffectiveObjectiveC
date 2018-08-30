//
//  BaseViewController.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/30.
//  Copyright © 2018年 David. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _nameTitle;
    [self.navigationItem.backBarButtonItem setTitle:@"Back"];
}

@end
