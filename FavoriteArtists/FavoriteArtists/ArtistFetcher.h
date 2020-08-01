//
//  ArtistFetcher.h
//  FavoriteArtists
//
//  Created by patelpra on 8/1/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ArtistFetcherCompltionHandler)(NSArray *_Nullable artists, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ArtistFetcher : NSObject

- (void)fetchArtistsWithName:(NSString *)name
           completionHandler:(ArtistFetcherCompltionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
