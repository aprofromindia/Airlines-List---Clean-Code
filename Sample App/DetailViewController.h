//
//  DetailViewController.h
//  Sample App
//
//  Created by Apro on 09/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewInterface.h"

@class AirlineModel, DetailPresenter;

@interface DetailViewController : UIViewController<DetailViewInterface>

@property (nonnull, nonatomic, strong) DetailPresenter *presenter;

@end

