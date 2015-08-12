//
//  MasterDependencyManager.h
//  Sample App
//
//  Created by Apro on 12/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MasterViewController;

@interface MasterDependencies : NSObject

- (void) injectView:(MasterViewController *) view;

@end
