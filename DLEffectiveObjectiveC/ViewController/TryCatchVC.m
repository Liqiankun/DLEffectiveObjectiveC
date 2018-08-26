//
//  TryCatchVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/26.
//  Copyright © 2018年 David. All rights reserved.
//

#import "TryCatchVC.h"
#import "TryCatch.h"

@interface TryCatchVC ()

@end

@implementation TryCatchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TryCatch *tryCatch = [[TryCatch alloc] init];
    @try {
        [tryCatch doSomething];
    }
    @catch (...) {
        NSLog(@"There is an error");
    }

}

-(void)dealloc {
    NSLog(@"TryCatchVC dealloc");
}

@end
