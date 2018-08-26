//
//  DelegateVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "DelegateVC.h"
#import "NetworkFetcher.h"

@interface DelegateVC ()<NetworkFetcherDelegate>

@property(nonatomic,strong)NetworkFetcher *fetcher;

@end

@implementation DelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _fetcher = [[NetworkFetcher alloc] init];
    _fetcher.delegate = self;
    [_fetcher fetch];
}

-(void)networkFetcher:(NetworkFetcher *)fetcher didUpdateProgressTo:(float)progress {
    NSLog(@"progress - %f", progress);
}

-(void)dealloc {
    NSLog(@"DelegateVC dealloc");
}

@end
