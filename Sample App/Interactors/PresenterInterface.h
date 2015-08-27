//
//  PresenterInterface.h
//  Sample App
//
//  Created by Apro on 12/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JSONModelArray;

@protocol PresenterInterface <NSObject>

/// Sets Interactor response for all items.
- (void) setResponse:(JSONModelArray *) response;

@end


@protocol FavouritePresenterInterface <NSObject>

/// Sets Interactor response for favorite items.
- (void) setFavouriteResponse:(NSArray *) favResponse;

@end