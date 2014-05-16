//
//  Article.h
//  Q-Carp
//
//  Created by Jarvis.Tang on 14-1-22.
//  Copyright (c) 2014年 Jarvis.Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property(nonatomic,strong)NSString *contentUrl;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *author;
@property(nonatomic,strong)NSString *art_imageUrl;
@property(nonatomic,strong)NSString *fetch_time;
@property(nonatomic,strong)NSString *summary;

@end
