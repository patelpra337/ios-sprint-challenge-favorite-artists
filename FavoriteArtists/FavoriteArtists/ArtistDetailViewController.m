//
//  ArtistDetailViewController.m
//  FavoriteArtists
//
//  Created by patelpra on 8/3/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import "ArtistDetailViewController.h"
#import "Artist.h"
#import "ArtistFetcher.h"
#import "FavoriteArtists.h"

@interface ArtistDetailViewController ()

@property ArtistFetcher *artistFetcher;

@property (nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic) IBOutlet UILabel *artistNameLabel;
@property (nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (nonatomic) IBOutlet UILabel *biographyLabel;

@end

@interface  ArtistDetailViewController (UISearchBarDelegate) <UISearchBarDelegate>

@end

@implementation ArtistDetailViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.artistFetcher = [[ArtistFetcher alloc] init];
    
    self.searchBar.delegate = self;
    
    if (self.favoriteArtistDetail) {
        [self.searchBar removeFromSuperview];
        self.navigationItem.rightBarButtonItem = nil;
    }
    
    [self updateViews];
}

- (IBAction)setSaveButton:(UIBarButtonItem *)sender
{
    if (self.artist == nil) return;
    [self.favoriteArtists addArtists:self.artist];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
