//
//  PresenterInterface.h
//  Sample App
//
//  Created by Apro on 12/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PresenterInterface <NSObject>

/// Sets Interactor response for all items.
- (void) setResponse:(NSArray *) response;

@end


@protocol FavouritePresenterInterface <NSObject>

/// Sets Interactor response for favorite items.
- (void) setFavouriteResponse:(NSArray *) favResponse;

@end