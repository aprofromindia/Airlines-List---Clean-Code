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
- (instancetype)initWithView:(id<DetailViewInterface>) view
                     airline:(AirlineModel *)airline
                  interactor:(FavouriteAirlinesInteractor *)interactor;

/// Adds an airline to the favourite list
- (void) addToFavourite;

/// Remove an airline from favorite.
- (void) removeFromFavourite;

@end
