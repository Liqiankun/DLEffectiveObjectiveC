//
//  CacheVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/9/1.
//  Copyright © 2018年 David. All rights reserved.
//

#import "CacheVC.h"

@interface CacheVC () {
    NSCache *_cache;
}

@end

@implementation CacheVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cache = [[NSCache alloc] init];
    _cache.countLimit = 100;
    _cache.totalCostLimit = 5 * 1024 * 1024;
    
}

-(void)downloadDataWithURL:(NSURL *)url {
    NSPurgeableData *cachedData = [_cache objectForKey:url];
    if (cachedData) {
        NSLog(@"data - %@", cachedData);
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSPurgeableData *purgeableData = [[NSPurgeableData alloc] initWithData:[[NSData alloc] init]];
            [self->_cache setObject:purgeableData forKey:url];
            [purgeableData endContentAccess];
        });
    }
}
 
@end
