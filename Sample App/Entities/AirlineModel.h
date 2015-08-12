//
//  AirlineModel.h
//  Sample App
//
//  Created by Apro on 09/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "JSONModel.h"

/// Base URL for Airlines Model.
extern NSString *const APRAirlineBaseURL;

@protocol AirlineModel <NSObject>

@end


@interface AirlineModel : JSONModel<NSCoding>

/// Image URL
@property(nonatomic, copy) NSString *logoURL;

/// Airline name
@property(nonatomic, copy) NSString *name;

/// Web URL
@property(nonatomic, copy) NSString *site;

/// Airline phone number
@property(nonatomic, copy) NSString *phone;

/// is Airline marked favourite.
@property(nonatomic) BOOL isFavourite;

@end
