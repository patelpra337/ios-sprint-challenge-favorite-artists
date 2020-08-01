//
//  Artist.m
//  FavoriteArtists
//
//  Created by patelpra on 8/1/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithName:(NSString *)name
                  yearFormed:(int)yearFormed
                   biography:(NSString *)biography
{
    if (self = [super init]) {
        _name =name.copy;
        _yearFormed = yearFormed;
        _biography = biography.copy;
    }
    return self;
}

@end
