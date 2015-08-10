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

- (instancetype)initWithRepository:(id<FavouriteAirlinesRepository>) repository
                         presenter:(id<FavouritePresenterInterface>) presenter;

- (void) fetchList;

- (void) saveList;

- (void) addAirline:(AirlineModel *) airline;

- (void) removeAirline:(AirlineModel *) airline;

@end
