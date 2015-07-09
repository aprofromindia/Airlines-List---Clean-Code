//
//  DetailViewController.h
//  Sample App
//
//  Created by Apro on 09/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

