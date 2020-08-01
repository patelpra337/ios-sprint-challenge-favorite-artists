//
//  ArtistResult.h
//  FavoriteArtists
//
//  Created by patelpra on 8/1/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;

NS_ASSUME_NONNULL_BEGIN

@interface ArtistResult : NSObject

@property (nonatomic, readonly, copy) NSArray<Artist *> *artists;

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
