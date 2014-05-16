//
//  Article.m
//  Q-Carp
//
//  Created by Jarvis.Tang on 14-1-22.
//  Copyright (c) 2014年 Jarvis.Tang. All rights reserved.
//

#import "Article.h"

@implementation Article

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contentUrl = @"";
        _title = @"";
        _author = @"";
        _art_imageUrl = @"";
        _fetch_time = @"";
        _summary = @"";
    }
    return self;
}

@end
