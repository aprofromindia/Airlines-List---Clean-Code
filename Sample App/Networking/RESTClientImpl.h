//
//  RESTClient.h
//  Sample App
//
//  Created by Apro on 09/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RESTClient <NSObject>

- (void)fetchDataWithSuccessHandler:(void (^)(NSData *))successHandler
                         errorHandler:(void (^)(NSError *))errorHandler;

@end

@interface RESTClientImpl : NSObject<RESTClient>

+ (instancetype) sharedClient;

@end
