//
//  DetailViewController.m
//  Sample App
//
//  Created by Apro on 09/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "DetailViewController.h"
#import "AirlineModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DetailPresenter.h"

static NSString *const kHTTP = @"http://";

@implementation DetailViewController{
    IBOutlet UILabel *__weak _nameLabel;
    IBOutlet UIImageView *__weak _logoImageView;
    IBOutlet UILabel *__weak _phoneLabel;
    IBOutlet UILabel *__weak _webpageLabel;
    IBOutlet UISwitch *__weak _favouriteSwitch;
    
    AirlineModel *_airlineVM;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setViewModel:_airlineVM];
}

- (void) setViewModel:(AirlineModel *)airlineVM{
    _airlineVM = airlineVM;
    self.title = _airlineVM.name;
    _nameLabel.text = _airlineVM.name;
    [_logoImageView sd_setImageWithURL:[NSURL URLWithString:_airlineVM.logoURL]];
    _phoneLabel.text = _airlineVM.phone;
    _webpageLabel.text = _airlineVM.site;
    _favouriteSwitch.on = _airlineVM.isFavourite;
}

- (IBAction) p_websiteBtnPressed{
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:[kHTTP stringByAppendingString:_airlineVM.site]]];
}


- (IBAction) p_favSwitchToggled{
    if (_favouriteSwitch.on) {
        [_presenter addToFavourite];
    }else{
        [_presenter removeFromFavourite];
    }
}

@end