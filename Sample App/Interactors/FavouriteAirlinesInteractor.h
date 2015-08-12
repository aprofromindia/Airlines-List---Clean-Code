//
//  SaveAirlinesInteractor.h
//  Sample App
//
//  Created by Apro on 11/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AirlinesRepository.h"
#import "PresenterInterface.h"

@class AirlineModel;

@interface FavouriteAirlinesInteractor : NSObject

@property(nonnull, nonatomic, weak) id<FavouritePresenterInterface> presenter;

NS_ASSUME_NONNULL_BEGIN

- (instancetype)initWithRepository:(id<FavouriteAirlinesRepository>) repository NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

- (void) fetchList;

- (void) saveList;

- (void) addAirline:(AirlineModel *) airline;

- (void) removeAirline:(AirlineModel *) airline;

NS_ASSUME_NONNULL_END

@end
