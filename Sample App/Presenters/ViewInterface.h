//
//  View.h
//  Sample App
//
//  Created by Apro on 12/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AirlineModel;

@protocol MasterViewInterface <NSObject>

/// Sets View Model into Master view.
- (void) setViewModel:(NSArray *) viewModel;

@end

@protocol DetailViewInterface <NSObject>

/// Sets View Model into Detail view.
- (void) setViewModel:(AirlineModel *) airlineVM;

@end
