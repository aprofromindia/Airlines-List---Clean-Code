//
//  MasterViewController.m
//  Sample App
//
//  Created by Apro on 09/07/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "MasterPresenter.h"
#import "AirlineModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "AirlineTableViewCell.h"


@implementation MasterViewController{
    MasterPresenter *_presenter;
    NSArray *_viewModel;
    BOOL _isShowingFavorites;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _isShowingFavorites = NO;
    [self p_showHud];
    _presenter = [[MasterPresenter alloc] initWithView:self];
    
    //setting up persisting favourite list.
    [[NSNotificationCenter defaultCenter] addObserver:_presenter selector:@selector(saveFavouritesList) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    if (_isShowingFavorites) {
        [self.tableView reloadData];
    }
}

- (void)setViewModel:(NSArray *)viewModel{
    [self p_showHud];
    if (viewModel) {
        _viewModel = viewModel;
        [self.tableView reloadData];
    }else{
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Network Error", nil)
                                    message:NSLocalizedString(@"Please try again later", nil)
                                   delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil)
                          otherButtonTitles:nil] show];
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark - private methods

- (void) p_showHud{
    if (![MBProgressHUD HUDForView:self.view]) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        AirlineModel *detailVM = _viewModel[indexPath.row];
        
        DetailViewController *detailVC = [segue destinationViewController];
        detailVC.presenter = [_presenter detailPresenterWitView:detailVC model:detailVM];
    }
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AirlineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    AirlineModel *airline = _viewModel[indexPath.row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:airline.logoURL]];
    cell.label.text = airline.name;
    
    return cell;
}

- (IBAction) p_toggleFavouriteList{
    _isShowingFavorites = !_isShowingFavorites;
    
    if (_isShowingFavorites) {
        [_presenter showFavoriteItems];
    }else{
        [_presenter showAllItems];
    }
}

@end
