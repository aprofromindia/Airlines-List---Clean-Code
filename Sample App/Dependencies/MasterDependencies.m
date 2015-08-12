//
//  MasterDependencyManager.m
//  Sample App
//
//  Created by Apro on 12/08/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "MasterDependencies.h"
#import "MasterViewController.h"
#import "MasterPresenter.h"
#import "AirlinesInteractor.h"
#import "FavouriteAirlinesInteractor.h"
#import "AirlinesRepositoryImpl.h"
#import "FavouriteAirlinesRepositoryImpl.h"

@implementation MasterDependencies

- (void)injectView:(MasterViewController *)view{
    
    AirlinesRepositoryImpl *repository = [[AirlinesRepositoryImpl alloc]
                                          initWithRestClient:[RESTClientImpl sharedClient]];
    
    AirlinesInteractor *interactor = [[AirlinesInteractor alloc] initWithRepository:repository];
    
    FavouriteAirlinesRepositoryImpl *favRepository = [[FavouriteAirlinesRepositoryImpl alloc] init];
    
    FavouriteAirlinesInteractor *favInteractor = [[FavouriteAirlinesInteractor alloc]
                                                  initWithRepository:favRepository];
    
    MasterPresenter *presenter = [[MasterPresenter alloc] initWithView:view
                                                            interactor:interactor
                                                   favouriteInteractor:favInteractor];
    
    view.presenter = presenter;
    interactor.presenter = presenter;
    favInteractor.presenter = presenter;
}

@end
