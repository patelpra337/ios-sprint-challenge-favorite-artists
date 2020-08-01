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
    NSString *name = [dictionary objectForKey:@"artist"];
    if (![name isKindOfClass:[NSString class]]) return nil;
    
    NSNumber *yearFormed = [dictionary objectForKey:@"formedYear"];
    if ([yearFormed isKindOfClass:[NSNull class]]) {
        yearFormed = nil;
    } else if ([yearFormed isKindOfClass:[NSString class]]) {
        NSString *yearFormedString = [dictionary objectForKey:@"formedYear"];
        yearFormed = @([yearFormedString intValue]);
    } else if (![yearFormed isKindOfClass:[NSNumber class]]) return nil;
    
    NSString *biography = [dictionary objectForKey:@"biography"];
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
    
    return @{ @"Artist": self.name,
              @"FormedYear": yearFormed,
              @"Biography": self.biography
    };
}

@end
