//
//  AirlineCell.h
//  Sample App
//
//  Created by Apro on 12/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AirlineTableViewCell : UITableViewCell

/// Logo Image View
@property(nonatomic, weak) IBOutlet UIImageView *imgView;

/// Airline Name Label
@property(nonatomic, weak) IBOutlet UILabel *label;

@end
