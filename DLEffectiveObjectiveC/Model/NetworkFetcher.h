//
//  NetworkFetcher.h
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NetworkFetcherCompletionHandler) (NSData *data);
typedef void (^NetworkFetcherFailureHandler) (NSError *error);

@class NetworkFetcher;

@protocol NetworkFetcherDelegate <NSObject>

@optional
-(void)networkFetcher:(NetworkFetcher *)fetcher didReceiveData:(NSData *)data;
-(void)networkFetcher:(NetworkFetcher *)fetcher didFailWithError:(NSError *)error;
-(void)networkFetcher:(NetworkFetcher *)fetcher didUpdateProgressTo:(float)progress;

@end

@interface NetworkFetcher : NSObject

@property (nonatomic, weak) id<NetworkFetcherDelegate> delegate;

@property(nonatomic,copy) NetworkFetcherCompletionHandler completionHandler;

-(void)fetch;

-(void)fetchWithCompletionHandler:(NetworkFetcherCompletionHandler)completionHandler;

-(void)fetchWithCompletionHandler:(NetworkFetcherCompletionHandler)completionHandler failureHandler:(NetworkFetcherFailureHandler)failureHandler;

@end
