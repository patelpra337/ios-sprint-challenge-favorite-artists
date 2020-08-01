//
//  Artist.h
//  FavoriteArtists
//
//  Created by patelpra on 8/1/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Artist : NSObject

@property (nonatomic, readonly, copy)NSString *name;
@property (nonatomic, readonly) int yearFormed;
@property (nonatomic, readonly, copy, nullable) NSString *biography;

- (instancetype)initWithName:(NSString *)name
                  yearFormed:(int)yearFormed
                   biography:(NSString *)biography NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
