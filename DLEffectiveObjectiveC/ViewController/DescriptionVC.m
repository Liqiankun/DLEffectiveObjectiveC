//
//  DescriptionVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "DescriptionVC.h"
#import "Square.h"

@interface DescriptionVC ()

@end

@implementation DescriptionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    Square *square = [[Square alloc] initWithDimension:5.0];
    NSLog(@"Square - %@", square);
    
}

@end
