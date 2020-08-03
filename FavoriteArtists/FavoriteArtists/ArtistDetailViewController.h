//
//  ArtistDetailViewController.h
//  FavoriteArtists
//
//  Created by patelpra on 8/3/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Artist;
@class FavoriteArtists;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistDetailViewController : UIViewController

@property (nonatomic, nullable) Artist *artist;
@property (nonatomic, nullable) FavoriteArtists *favoriteArtists;
@property (nonatomic) BOOL favoriteArtistDetail;

@end

NS_ASSUME_NONNULL_END
