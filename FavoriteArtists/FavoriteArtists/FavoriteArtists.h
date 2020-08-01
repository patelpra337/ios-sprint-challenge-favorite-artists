//
//  FavoriteArtists.h
//  FavoriteArtists
//
//  Created by patelpra on 8/1/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface FavoriteArtists : NSObject

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

- (instancetype)init;

- (void)addArtists:(Artist *)artist;
- (void)deleteArtist:(Artist *)artist;

@end

NS_ASSUME_NONNULL_END
