//
//  SaveAirlinesInteractor.m
//  Sample App
//
//  Created by Apro on 11/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "FavouriteAirlinesInteractor.h"
#import "AirlineModel.h"
#import "PresenterInterface.h"

@implementation FavouriteAirlinesInteractor{
    NSMutableArray *_favAirlines;
    id<FavouriteAirlinesRepository> _repository;
}

- (instancetype)initWithRepository:(id<FavouriteAirlinesRepository>) repository
{
    self = [super init];
    if (self) {
        _repository = repository;
    }
    return self;
}

// set favAirlines to previously saved value and an empty array if none was saved.
- (void)fetchList{
    if (!(_favAirlines = [[_repository favouriteAirlines] mutableCopy])) {
        _favAirlines = [NSMutableArray new];
    }
    [self p_updatePresenter];
}

- (void)saveList {
    [_repository saveFavouriteAirlines:_favAirlines];
}

- (void)addAirline:(AirlineModel *) airline{
    if (!airline.isFavourite) {
        [_favAirlines addObject:airline];
        airline.isFavourite = YES;
        [self p_updatePresenter];
    }
}

- (void)removeAirline:(AirlineModel *)airline{
    if (airline.isFavourite) {
        [_favAirlines removeObject:airline];
        airline.isFavourite = NO;
        [self p_updatePresenter];
    }
}

- (void) p_updatePresenter{
    [_presenter setFavouriteResponse:_favAirlines];
}

@end
