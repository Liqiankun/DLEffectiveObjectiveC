//
//  BlockVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/26.
//  Copyright © 2018年 David. All rights reserved.
//

#import "BlockVC.h"
#import "NetworkFetcher.h"

typedef void (^DefineBlock)(BOOL flag, int number);

@interface BlockVC () {
    NSString *_myName;
    NSData *_data;
    NetworkFetcher *_fetcher;
}

@end

@implementation BlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    void (^someBlock)(void) = ^{
        NSLog(@"This is someBlock");
    };
    
    someBlock();
    
    __block int additional = 5;
    int (^addBlock) (int a, int b) = ^(int a, int b){
        additional = 8;
        return a + b + additional;
    };
    
    NSLog(@"additional - %d", additional);
    
    int add = addBlock(3, 4);
    NSLog(@"add - %d", add);
    
    void (^setMyName)(void) = ^{
        self->_myName = @"David";
    };
    
    setMyName();
    NSLog(@"_myName - %@", _myName);
    
    DefineBlock block = ^(BOOL flag, int number){
        NSLog(@"block");
    };
    
    block(YES, 2);
    
    _fetcher = [[NetworkFetcher alloc] init];
    [_fetcher fetchWithCompletionHandler:^(NSData *data) {
        self->_data = data;
        NSLog(@"data - %@", data);
    } failureHandler:^(NSError *error) {
        NSLog(@"error - %@", error);
    }];
    
    [_fetcher fetchWithCompletionHandler:^(NSData *data) {
        self->_data = data;
    }];
    
}

-(void)dealloc {
    NSLog(@"BlockVC dealloc");
}


@end
