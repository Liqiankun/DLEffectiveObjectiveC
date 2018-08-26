//
//  NetworkFetcher.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "NetworkFetcher.h"

@interface NetworkFetcher () {
    struct {
        unsigned int didReceiveData      : 1;
        unsigned int didFailWithError    : 1;
        unsigned int didUpdateProgressTo : 1;
    } _delegateFlags;
}

@end

@implementation NetworkFetcher

-(void)setDelegate:(id<NetworkFetcherDelegate>)delegate {
    _delegate = delegate;
    _delegateFlags.didUpdateProgressTo = [delegate respondsToSelector:@selector(networkFetcher:didUpdateProgressTo:)];
    _delegateFlags.didReceiveData = [delegate respondsToSelector:@selector(networkFetcher:didReceiveData:)];
    _delegateFlags.didFailWithError = [delegate respondsToSelector:@selector(networkFetcher:didFailWithError:)];
}

-(void)fetch {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self->_delegateFlags.didUpdateProgressTo) {
            [weakSelf.delegate networkFetcher:weakSelf didUpdateProgressTo:30];
        }
    });
}

-(void)fetchWithCompletionHandler:(NetworkFetcherCompletionHandler)completionHandler {
    self.completionHandler = completionHandler;
    [self p_callCompletionMethod];
}

-(void)fetchWithCompletionHandler:(NetworkFetcherCompletionHandler)completionHandler failureHandler:(NetworkFetcherFailureHandler)failureHandler{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (completionHandler) {
            completionHandler([NSData new]);
        }
    });
}

-(void)p_callCompletionMethod {
    if (_completionHandler) {
        _completionHandler([NSData new]);
        _completionHandler = nil;
    }
}

-(void)dealloc {
    NSLog(@"NetworkFetcher dealloc");
}

@end
