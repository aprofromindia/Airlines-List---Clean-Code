//
//  AirlinesRepositoryImpl.m
//  Sample App
//
//  Created by Apro on 11/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "AirlinesRepositoryImpl.h"
#import "RESTClientImpl.h"
#import "AirlineModel.h"

@implementation AirlinesRepositoryImpl{
    id<RESTClient> _restClient;
}

- (instancetype)initWithRestClient:(id<RESTClient>) restClient
{
    self = [super init];
    if (self) {
        _restClient = restClient;
    }
    return self;
}

- (void) fetchAirlinesWithBlock:(void (^)(JSONModelArray *)) completionBlock
                     errorBlock:(void (^)(NSError *)) errorBlock{
    
    [_restClient fetchDataWithSuccessHandler:^(NSData * data) {
        
        NSError *jsonError = nil;
        JSONModelArray *airlines = [[JSONModelArray alloc] initWithArray:[AirlineModel
                                                                          arrayOfModelsFromData:data error:&jsonError]
                                                              modelClass:[AirlineModel class]];
        if (!jsonError) {
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                completionBlock(airlines);
            }];
        }
        
    } errorHandler:^(NSError *error) {
        if (error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                errorBlock(error);
            }];
        }
    }];
}

@end
