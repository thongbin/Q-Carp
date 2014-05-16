//
//  ArticleCell.h
//  Q-Carp
//
//  Created by Jarvis.Tang on 14-1-21.
//  Copyright (c) 2014年 Jarvis.Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"
@interface ArticleCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *fetchTime_Author;

@property(nonatomic,strong)Article *article;

+ (CGFloat)heightForCellWithPost:(Article *)article;
@end
