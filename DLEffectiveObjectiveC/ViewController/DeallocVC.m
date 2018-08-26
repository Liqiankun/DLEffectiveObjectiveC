//
//  DeallocVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/26.
//  Copyright © 2018年 David. All rights reserved.
//

#import "DeallocVC.h"

@interface DeallocVC ()

@property (nonatomic, assign, readwrite) NSUInteger number;

@end

static  NSString * const dl_notificationNameKey = @"dl_notificationNameKey";

@implementation DeallocVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveNotification) name:dl_notificationNameKey object:nil];
    
    _number = 3;
    
    [self addObserver:self forKeyPath:@"number" options:NSKeyValueObservingOptionNew context:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.number = 2;
    });
    
    [self performSelector:@selector(changeNumber) withObject:nil afterDelay:3];
}

-(void)changeNumber {
    self.number = 3;
}

-(void)didReceiveNotification {
    NSLog(@"didReceiveNotification");
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"number"]) {
        NSLog(@"number - %@", change[NSKeyValueChangeNewKey]);
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:@"number"];
    NSLog(@"DeallocVC dealloc");
}

@end
