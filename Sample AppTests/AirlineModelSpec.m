//
//  AirlineModelSpec.m
//  Sample App
//
//  Created by Apro on 12/08/15.
//  Copyright 2015 Apro. All rights reserved.
//

#import "Specta.h"
#import "AirlineModel.h"

SpecBegin(AirlineModel)

describe(@"AirlineModel", ^{
    
    __block AirlineModel *_model;
    
    beforeEach(^{
        _model = [AirlineModel new];
    });
    
    it(@"", ^{

    });  
    
    afterEach(^{
        _model = nil;
    });
    
});

SpecEnd
