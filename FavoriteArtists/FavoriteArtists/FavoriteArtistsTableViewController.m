//
//  FavoriteArtistsTableViewController.m
//  FavoriteArtists
//
//  Created by patelpra on 8/3/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import "FavoriteArtistsTableViewController.h"
#import "Artist.h"
#import "FavoriteArtists.h"
#import "ArtistDetailViewController.h"

@interface FavoriteArtistsTableViewController ()

@property FavoriteArtists *favoriteArtists;

@end

@implementation FavoriteArtistsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.favoriteArtists = [[FavoriteArtists alloc] init];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.favoriteArtists.artists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteArtistCell" forIndexPath:indexPath];
    
    Artist *artist = [self.favoriteArtists.artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.name;
    
    if (artist.yearFormed != 0) {
        NSString *yearFormedString = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
        cell.detailTextLabel.text = yearFormedString;
    } else {
        cell.detailTextLabel.text = nil;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Artist *artist = [self.favoriteArtists.artists objectAtIndex:indexPath.row];
        [self.favoriteArtists deleteArtist:artist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    }   
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"ShowArtistDetailSegue"]) {
        ArtistDetailViewController *artistDetailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Artist *artist = [self.favoriteArtists.artists objectAtIndex:indexPath.row];
        
        artistDetailVC.artist = artist;
        artistDetailVC.favoriteArtistDetail = YES;
    } else if ([[segue identifier] isEqualToString:@"ShowAddArtistSegue"]) {
        ArtistDetailViewController *artistDetailVC = [segue destinationViewController];
        
        artistDetailVC.favoriteArtistDetail = NO;
        artistDetailVC.favoriteArtistDetail = self.favoriteArtists;
    }
}

@end
