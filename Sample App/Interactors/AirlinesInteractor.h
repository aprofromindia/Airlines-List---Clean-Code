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

@property(nonnull, nonatomic, weak) id<PresenterInterface> presenter;

NS_ASSUME_NONNULL_BEGIN

- (instancetype)initWithRepository:(id<AirlinesRepository>) repository NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

- (void) fetchAirlines;

NS_ASSUME_NONNULL_END

@end
