//
//  MasterViewController.h
//  Sample App
//
//  Created by Apro on 09/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewInterface.h"
@class MasterPresenter;

@interface MasterViewController : UITableViewController<MasterViewInterface>

@property(nonnull, nonatomic, strong) MasterPresenter *presenter;

@end
