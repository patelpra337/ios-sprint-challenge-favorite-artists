//
//  FavoriteArtists.m
//  FavoriteArtists
//
//  Created by patelpra on 8/1/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteArtists.h"
#import "Artist.h"
#import "Artist+NSJSONSerialization.h"

@interface FavoriteArtists () {
    NSMutableArray *_internalArtists;
}

@end

@implementation FavoriteArtists

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtists = [[NSMutableArray alloc] init];
        
        // Load favorite artists from disk
        NSString *filePath = self.getFilePath;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if ([fileManager fileExistsAtPath:filePath]) {
            NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfURL:self.getFileURL];
            [self updateArtistsArrayWithDictionary:dictionary];
        }
    }
    return self;
}

#pragma mark - Convenience Accessors

- (NSArray<Artist *> *)artists
{
    return _internalArtists.copy;
}

- (void)addArtists:(Artist *)artist
{
    [_internalArtists addObject:artist];
    [self saveToPersistentStore];
}

- (void)deleteArtist:(Artist *)artist
{
    [_internalArtists removeObject:artist];
    [self saveToPersistentStore];
}

- (NSURL *)getFileURL
{
    NSString *fileName = @"FavoriteArtistsData.plist";
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSURL *fileURL = [baseURL URLByAppendingPathComponent:fileName];
    return fileURL;
}

- (NSString *)getFilePath
{
    return self.getFileURL.path;
}

- (void)saveToPersistentStore
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for (Artist *artist in _internalArtists) {
        NSString *key = artist.name;
        dictionary[key] = artist.toDictionary;
    }
    
    [dictionary writeToURL:self.getFileURL atomically:YES];
}

- (void)updateArtistsArrayWithDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSDictionary *artistDictionary in dictionary.allValues) {
        Artist *artist = [[Artist alloc] initWithdictionary:artistDictionary];
        [array addObject:artist];
    }
    
    _internalArtists = array;
}

@end
