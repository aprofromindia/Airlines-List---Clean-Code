//
//  AirlineRepository.m
//  Sample App
//
//  Created by Apro on 11/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "FavouriteAirlinesRepositoryImpl.h"

static NSString *const kFileName = @"APRFavAirlines";

@implementation FavouriteAirlinesRepositoryImpl{
    NSString *_filePath;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
                      firstObject] stringByAppendingPathComponent:kFileName];
    }
    return self;
}

- (void)saveFavouriteAirlines:(NSArray *)favAirlines{
    [NSKeyedArchiver archiveRootObject:favAirlines toFile:_filePath];
}

- (NSArray *)favouriteAirlines{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:_filePath];
}

@end
