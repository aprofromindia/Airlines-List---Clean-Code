//
//  AirlinesRepositoryImpl.h
//  Sample App
//
//  Created by Apro on 11/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AirlinesRepository.h"
#import "RESTClientImpl.h"

@interface AirlinesRepositoryImpl : NSObject<AirlinesRepository>

NS_ASSUME_NONNULL_BEGIN

- (instancetype)initWithRestClient:(id<RESTClient>) restClient;

NS_ASSUME_NONNULL_END

@end
