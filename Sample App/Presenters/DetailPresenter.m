//
//  DetailPresenter.m
//  Sample App
//
//  Created by Apro on 10/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "DetailPresenter.h"
#import "AirlineModel.h"
#import "FavouriteAirlinesInteractor.h"

@implementation DetailPresenter{
    AirlineModel *_detailVM;
    FavouriteAirlinesInteractor *_interactor;
    id<DetailViewInterface> _view;
}

- (instancetype)initWithView:(id<DetailViewInterface>)view
                     airline:(AirlineModel *)airline
                  interactor:(FavouriteAirlinesInteractor *)interactor
{
    self = [super init];
    if (self) {
        _view = view;
        _detailVM = airline;
        _interactor = interactor;
        [_view setViewModel:_detailVM];
    }
    return self;
}

- (void)addToFavourite {
    [_interactor addAirline:_detailVM];
}

- (void)removeFromFavourite{
    [_interactor removeAirline:_detailVM];
}

@end
