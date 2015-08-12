//
//  GetAirlinesInteractor.m
//  Sample App
//
//  Created by Apro on 11/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "AirlinesInteractor.h"
#import <JSONModel/JSONModel.h>
#import "AirlineModel.h"

@implementation AirlinesInteractor{
    id<AirlinesRepository> _repository;    
    NSArray<AirlineModel, ConvertOnDemand> *_airlines;
}

- (instancetype)initWithRepository:(id<AirlinesRepository>) repository
{
    self = [super init];
    if (self) {
        _repository = repository;
    }
    return self;
}

- (void) fetchAirlines{
    [_repository fetchAirlinesWithBlock:^(NSArray<AirlineModel, ConvertOnDemand> * airlines) {
        _airlines = airlines;
        [_presenter setResponse:_airlines];
    } errorBlock:^(NSError * error) {
        
    }];
}

@end
