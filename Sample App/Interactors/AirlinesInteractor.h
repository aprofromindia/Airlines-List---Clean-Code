//
//  GetAirlinesInteractor.h
//  Sample App
//
//  Created by Apro on 11/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AirlinesRepository.h"
#import "PresenterInterface.h"

@class InteractorResponseModel;

@interface AirlinesInteractor : NSObject

- (instancetype)initWithRepository:(id<AirlinesRepository>) repository
                         presenter:(id<PresenterInterface>) presenter;

- (void) fetchAirlines;

@end
