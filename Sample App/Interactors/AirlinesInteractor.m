//
//  GetAirlinesInteractor.m
//  Sample App
//
//  Created by Apro on 11/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "AirlinesInteractor.h"
#import <JSONModel/JSONModel.h>

@implementation AirlinesInteractor{
    id<AirlinesRepository> _repository;
    id<PresenterInterface> _presenter;
    
    NSArray<ConvertOnDemand> *_airlines;
}

- (instancetype)initWithRepository:(id<AirlinesRepository>) repository
                         presenter:(id<PresenterInterface>)presenter
{
    self = [super init];
    if (self) {
        _repository = repository;
        _presenter = presenter;
    }
    return self;
}

- (void) fetchAirlines{
    [_repository fetchAirlinesWithBlock:^(NSArray * airlines) {
        _airlines = airlines;
        [_presenter setResponse:_airlines];
    } errorBlock:^(NSError * error) {
        
    }];
}

@end
