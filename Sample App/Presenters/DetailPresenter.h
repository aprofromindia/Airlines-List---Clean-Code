//
//  DetailPresenter.h
//  Sample App
//
//  Created by Apro on 10/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewInterface.h"
#import "PresenterInterface.h"

@class AirlineModel, FavouriteAirlinesInteractor;

@interface DetailPresenter : NSObject

/*!
 *  @brief  Default initialise
 *
 *  @param view       The View
 *  @param airline    The Airline View Model
 *  @param interactor the Favourites interactor
 *
 *  @return Class instance type.
 */
- (nonnull instancetype)initWithView:(nonnull id<DetailViewInterface>) view
                     airline:(nonnull AirlineModel *)airline
                  interactor:(nonnull FavouriteAirlinesInteractor *)interactor NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)init NS_UNAVAILABLE;

/// Adds an airline to the favourite list
- (void) addToFavourite;

/// Remove an airline from favorite.
- (void) removeFromFavourite;

@end
