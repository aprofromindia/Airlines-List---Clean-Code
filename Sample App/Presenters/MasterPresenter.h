//
//  MasterPresenter.h
//  Sample App
//
//  Created by Apro on 10/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewInterface.h"
#import "PresenterInterface.h"
@class AirlineModel, DetailPresenter;

@interface MasterPresenter : NSObject<PresenterInterface, FavouritePresenterInterface>

/*!
 *  @brief  Default Initialise
 *
 *  @param view the View.
 *
 *  @return object instance
 */
- (instancetype)initWithView:(id<MasterViewInterface>) view;


/*!
 *  @brief  Initialise the Detail Presenter based on user input.
 *
 *  @param view    Detail view
 *  @param airline Airline View Model
 *
 *  @return Detail Presenter
 */
- (DetailPresenter *) detailPresenterWitView:(id<DetailViewInterface>) view
                                       model:(AirlineModel *) airline;

/// Show all airlines.
- (void) showAllItems;


/// Show favorite airline list
- (void) showFavoriteItems;

/// Persists favorite airline list across app launches.
- (void) saveFavouritesList;

@end
