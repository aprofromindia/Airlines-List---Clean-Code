//
//  View.h
//  Sample App
//
//  Created by Apro on 12/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AirlineModel, JSONModelArray;

@protocol MasterViewInterface <NSObject>

/// Sets View Model into Master view.
- (void) setViewModel:(JSONModelArray *) viewModel;

@end

@protocol DetailViewInterface <NSObject>

/// Sets View Model into Detail view.
- (void) setViewModel:(AirlineModel *) airlineVM;

@end
