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

@implementation MasterPresenter{
    AirlinesInteractor *_airlinesInteractor;
    FavouriteAirlinesInteractor *_favAirlinesInteractor;
    
    NSArray *_airlines;
    NSArray *_favAirlines;
    
    id<MasterViewInterface> _view;
}

- (instancetype)initWithView:(id<MasterViewInterface>) view
{
    self = [super init];
    if (self) {
        _view = view;
        
        AirlinesRepositoryImpl *airlinesRepo = [[AirlinesRepositoryImpl alloc]
                                                initWithRestClient:[RESTClientImpl sharedClient]];
        _airlinesInteractor = [[AirlinesInteractor alloc] initWithRepository:airlinesRepo
                                                                   presenter:self];
        [_airlinesInteractor fetchAirlines];
        
        _favAirlinesInteractor = [[FavouriteAirlinesInteractor alloc]
                                  initWithRepository:[FavouriteAirlinesRepositoryImpl new] presenter:self];
        [_favAirlinesInteractor fetchList];
    }
    return self;
}

- (void)setResponse:(NSArray *)response{
    _airlines = response;
    [self p_setViewModel:_airlines];
}

- (void)setFavouriteResponse:(NSArray *)favResponse{
    _favAirlines = favResponse;
}

- (DetailPresenter *) detailPresenterWitView:(id<DetailViewInterface>) view
                                       model:(AirlineModel *) airline{
    DetailPresenter *detailPresenter = [[DetailPresenter alloc] initWithView:view
                                                                     airline:airline interactor:_favAirlinesInteractor];
    return detailPresenter;
}

- (void)showAllItems{
    [_view setViewModel:_airlines];
}

- (void)showFavoriteItems{
    [_view setViewModel:_favAirlines];
}

- (void) saveFavouritesList{
    [_favAirlinesInteractor saveList];
}

#pragma mark - private methods

- (void) p_setViewModel:(NSArray *) viewModel{
    [_view setViewModel:viewModel];
}

@end
