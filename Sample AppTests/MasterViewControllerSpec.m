//
//  MasterViewControllerSpec.m
//  Sample App
//
//  Created by Apro on 13/07/15.
//  Copyright 2015 Apro. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "MasterViewController.h"

@interface MasterViewController (Test)

@property(nonatomic) NSArray *viewModel;

@end

SpecBegin(MasterViewController)

describe(@"MasterViewController", ^{
    
    __block MasterViewController *_masterVC;
    
    beforeEach(^{
        _masterVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                     instantiateViewControllerWithIdentifier:@"Master"];
        
        [_masterVC view];
    });
    
    it(@"should not be nil and should be a kind of TableViewController ", ^{
        expect(_masterVC).notTo.beNil;
        expect(_masterVC).to.beKindOf([UITableViewController class]);
    });
    
    context(@"on initial launch", ^{
        
        it(@"viewModel should be nil", ^{
            expect(_masterVC.viewModel).to.beNil;
        });
        
        it(@"should load the viewModel asynchronously", ^{
            expect(_masterVC.viewModel).after(15).to.beInstanceOf([NSArray class]);
        });
    });
});

SpecEnd
