//
//  AirlinesRepository.h
//  Sample App
//
//  Created by Apro on 11/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AirlineModel, JSONModelArray;

@protocol AirlinesRepository <NSObject>


/*!
 *  @brief  Asynchronously fetched all Airlines list.
 *
 *  @param completionBlock Success completion block
 *  @param errorBlock      Error completion block.
 */
- (void) fetchAirlinesWithBlock:(void (^)(JSONModelArray *)) completionBlock
                     errorBlock:(void (^)(NSError *)) errorBlock;

@end


@protocol FavouriteAirlinesRepository <NSObject>

/*!
 *  @brief  Get favourite airlines list
 *
 *  @return Favourite Airline list.
 */
- (NSArray *) favouriteAirlines;


/*!
 *  @brief  Saves Favourite Airline list
 *
 *  @param favAirlines Favourite Airline list.
 */
- (void) saveFavouriteAirlines:(NSArray *) favAirlines;

@end
