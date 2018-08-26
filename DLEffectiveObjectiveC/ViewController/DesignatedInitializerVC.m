//
//  DesignatedInitializerVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "DesignatedInitializerVC.h"
#import "Rectangle.h"
#import "Square.h"

@interface DesignatedInitializerVC ()

@end

@implementation DesignatedInitializerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    Rectangle *rectangle = [[Rectangle alloc] init];
    
    Square *square = [[Square alloc] initWithDimension:5.0];
    
    NSLog(@"Square - %@, Rectangle - %@", square, rectangle);
    
}

@end
