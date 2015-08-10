//
//  AirlineModel.m
//  Sample App
//
//  Created by Apro on 09/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "AirlineModel.h"

NSString *const APRAirlineBaseURL = @"https://www.kayak.com";

@implementation AirlineModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    if ([propertyName isEqualToString:NSStringFromSelector(@selector(isFavourite))]) {
        return YES;
    }
    return NO;
}

- (void)setLogoURL:(NSString *)logoURL{
    _logoURL = [APRAirlineBaseURL stringByAppendingString:logoURL];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _logoURL = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(logoURL))];
        _name = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(name))];
        _site = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(site))];
        _phone = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(phone))];
        _isFavourite = [aDecoder decodeBoolForKey:NSStringFromSelector(@selector(isFavourite))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    [coder encodeObject:_logoURL forKey:NSStringFromSelector(@selector(logoURL))];
    [coder encodeObject:_name forKey:NSStringFromSelector(@selector(name))];
    [coder encodeObject:_site forKey:NSStringFromSelector(@selector(site))];
    [coder encodeObject:_phone forKey:NSStringFromSelector(@selector(phone))];
    [coder encodeBool:_isFavourite forKey:NSStringFromSelector(@selector(isFavourite))];
}

@end
