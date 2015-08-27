//
//  MasterPresenter.m
//  Sample App
//
//  Created by Apro on 10/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "MasterPresenter.h"
#import "AirlinesInteractor.h"
#import "FavouriteAirlinesInteractor.h"
#import "AirlinesRepositoryImpl.h"
#import "RESTClientImpl.h"
#import "FavouriteAirlinesRepositoryImpl.h"
#import "DetailPresenter.h"
#import <JSONModel/JSONModel.h>
#import "AirlineModel.h"

@implementation MasterPresenter{
    AirlinesInteractor *_interactor;
    FavouriteAirlinesInteractor *_favInteractor;
    
    JSONModelArray *_airlines;
    NSArray *_favAirlines;
    
    id<MasterViewInterface> __weak _view;
}

- (instancetype)initWithView:(id<MasterViewInterface>) view
                  interactor:(AirlinesInteractor *) interactor
         favouriteInteractor:(FavouriteAirlinesInteractor *) favInteractor
{
    self = [super init];
    if (self) {
        _view = view;
        _interactor = interactor;
        _favInteractor = favInteractor;
    }
    return self;
}

- (void) setup{
    [_interactor fetchAirlines];
    [_favInteractor fetchList];
}

- (void)setResponse:(JSONModelArray *)response{
    _airlines = response;
    [self p_setViewModel:_airlines];
}

- (void)setFavouriteResponse:(NSArray *)favResponse{
    _favAirlines = favResponse;
}

- (DetailPresenter *) detailPresenterWitView:(id<DetailViewInterface>) view
                                       model:(AirlineModel *) airline{
    DetailPresenter *detailPresenter = [[DetailPresenter alloc] initWithView:view
                                                                     airline:airline interactor:_favInteractor];
    return detailPresenter;
}

- (void)showAllItems{
    [_view setViewModel:_airlines];
}

- (void)showFavoriteItems{
    [_view setViewModel:_favAirlines];
}

- (void) saveFavouritesList{
    [_favInteractor saveList];
}

#pragma mark - private methods

- (void) p_setViewModel:(JSONModelArray *) viewModel{
    [_view setViewModel:viewModel];
}

@end
