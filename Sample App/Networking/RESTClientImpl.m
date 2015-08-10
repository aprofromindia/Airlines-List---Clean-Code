//
//  RESTClient.m
//  Sample App
//
//  Created by Apro on 09/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "RESTClientImpl.h"
#import "AirlineModel.h"

static NSString *const kJSONMimeType = @"application/json";
static const int kHTTPOK = 200;

@implementation RESTClientImpl{
    NSURLSession *_urlSession;
}

+ (instancetype)sharedClient{
    static RESTClientImpl *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance->_urlSession = [NSURLSession sharedSession];
    });
    return instance;
}

- (void)fetchDataWithSuccessHandler:(void (^)(NSData *))successHandler
                          errorHandler:(void (^)(NSError *))errorHandler{
    NSString *const urlPath = @"/h/mobileapis/directory/airlines";
    
    [[_urlSession dataTaskWithURL:[NSURL URLWithString:[APRAirlineBaseURL stringByAppendingString:urlPath]]
               completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                   
                   NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                   
                   if (!error && httpResponse.statusCode == kHTTPOK) {
                       successHandler(data);
                   }else{
                       errorHandler(error);
                   }
               }] resume];
}

@end
