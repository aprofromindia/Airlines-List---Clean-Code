//
//  RESTClientImplSpec.m
//  Sample App
//
//  Created by Apro on 13/07/15.
//  Copyright 2015 Apro. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "RESTClientImpl.h"

@interface RESTClientImpl (Test)

+ (instancetype) recreateSingleton;

@end

@implementation RESTClientImpl(Test)

+ (instancetype)recreateSingleton{
    RESTClientImpl *instance = [[self alloc] init];
    [instance setValue:[NSURLSession sharedSession] forKey:@"_urlSession"];
    return instance;
}

@end


SpecBegin(RESTClientImpl)

describe(@"RESTClientImpl", ^{
    
    __block RESTClientImpl *_restClient;
    
    beforeEach(^{
        _restClient = [RESTClientImpl recreateSingleton];
    });
    
    it(@"is not nil", ^{
        expect(_restClient).notTo.beNil;
    });
    
    it(@"conforms to RESTClient ", ^{
        expect(_restClient).to.conformTo(@protocol(RESTClient));
    });
    
    it(@"should fetch data asynchronously", ^{
        
        [_restClient fetchDataWithSuccessHandler:^(NSData *data) {
            expect(data).after(10).to.beInstanceOf([NSData class]);
        } errorHandler:^(NSError *error) {
            expect(error).after(10).to.beNil;
        }];
    });
    
    afterEach(^{
        _restClient = nil;
    });
});

SpecEnd
