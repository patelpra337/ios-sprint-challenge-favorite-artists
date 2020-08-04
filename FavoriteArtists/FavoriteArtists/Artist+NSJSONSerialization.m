//
//  Artist+NSJSONSerialization.m
//  FavoriteArtists
//
//  Created by patelpra on 8/1/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import "Artist+NSJSONSerialization.h"

@implementation Artist (NSJSONSerialization)

- (nullable instancetype)initWithdictionary:(NSDictionary *)dictionary
{
    NSString *name = [dictionary objectForKey:@"strArtist"];
    if (![name isKindOfClass:[NSString class]]) return nil;
    
    NSNumber *yearFormed = [dictionary objectForKey:@"intFormedYear"];
    if ([yearFormed isKindOfClass:[NSNull class]]) {
        yearFormed = nil;
    } else if ([yearFormed isKindOfClass:[NSString class]]) {
        NSString *yearFormedString = [dictionary objectForKey:@"intFormedYear"];
        yearFormed = @([yearFormedString intValue]);
    } else if (![yearFormed isKindOfClass:[NSNumber class]]) return nil;
    
    NSString *biography = [dictionary objectForKey:@"strBiographyEN"];
    if ([biography isKindOfClass:[NSNull class]]) {
        biography = nil;
    } else if (![biography isKindOfClass:[NSString class]]) return nil;
    
    return [self initWithName:name
                   yearFormed:yearFormed.intValue
                    biography:biography];
}

- (NSDictionary *)toDictionary;
{
    NSNumber *yearFormed = [NSNumber numberWithInt:self.yearFormed];
    
    return @{ @"strArtist": self.name,
              @"intFormedYear": yearFormed,
              @"strBiographyEN": self.biography };
}

@end
