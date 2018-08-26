//
//  AutoreleaseVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/26.
//  Copyright © 2018年 David. All rights reserved.
//

#import "AutoreleaseVC.h"
#import "Person.h"
#import "Person+Work.h"

@interface AutoreleaseVC () {
    NSMutableArray *_dataArray;
    NSMutableArray *_imageArray;
}

@end

@implementation AutoreleaseVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataArray = [[NSMutableArray alloc] init];
    _imageArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < 100000; i++) {
        @autoreleasepool {
            NSString *firstName = [NSString stringWithFormat:@"David_%lu", (unsigned long)i];
            NSString *lastName = [NSString stringWithFormat:@"Lee_%lu", (unsigned long)i];
            Person *person = [[Person alloc] initWithFirstName:firstName andLastName:lastName];
            [_dataArray addObject:person];
        }
    }

    for (NSUInteger i = 0; i < 1000; i++) {
        @autoreleasepool {
            UIImage *image = [UIImage imageNamed:@"image"];
            [_imageArray addObject:image];
        }
    }
    
}

-(void)dealloc {
    NSLog(@"AutoreleaseVC dealloc");
}

@end
