//
//  ArtistResult.m
//  FavoriteArtists
//
//  Created by patelpra on 8/1/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import "ArtistResult.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

@implementation ArtistResult

- (instancetype)initWithArtists:(NSArray<Artist *> *)artists
{
    if (self = [super init]) {
        _artists = artists;
    }
    return self;
}


- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSArray *artistDictionaries = [dictionary objectForKey:@"artists"];
    if (![artistDictionaries isKindOfClass:[NSArray class]]) return nil;
    
    NSMutableArray *artists = [[NSMutableArray alloc] initWithCapacity:artistDictionaries.count];
    
    for (NSDictionary *artistDictionary in artistDictionaries) {
        if (![artistDictionary isKindOfClass:[NSDictionary class]]) continue;
        
        Artist *artist = [[Artist alloc] initWithdictionary:artistDictionary];
        
        if (artist) {
            [artists addObject:artist];
        } else {
            // TODO: One of our "required" fields might be optional and we may need to debug this with real data
            NSLog(@"Unable to parse artist dictionary: %@", artistDictionary);
        }
    }
    
    return [self initWithArtists:artists];
}

@end
