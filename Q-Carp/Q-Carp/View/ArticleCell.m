//
//  ArticleCell.m
//  Q-Carp
//
//  Created by Jarvis.Tang on 14-1-21.
//  Copyright (c) 2014年 Jarvis.Tang. All rights reserved.
//

#import "ArticleCell.h"
#import "UIImageView+AFNetworking.h"

@implementation ArticleCell


- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
//    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    self.textLabel.textColor = [UIColor darkGrayColor];
    self.textLabel.numberOfLines = 0;
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    self.detailTextLabel.numberOfLines = 0;

    
    return self;
}

- (void)setArticle:(Article *)article{
    _article = article;
    
    self.textLabel.text = _article.title;
    self.detailTextLabel.text = _article.summary;
    [self.imageView setImageWithURL:[NSURL URLWithString:_article.art_imageUrl] placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];
    _fetchTime_Author.text = [NSString stringWithFormat:@"%@ by %@",_article.fetch_time,_article.author];
    
    [self setNeedsLayout];
}

+ (CGFloat)heightForCellWithPost:(Article *)article {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGSize sizeToFit = [article.summary sizeWithFont:[UIFont systemFontOfSize:12.0f] constrainedToSize:CGSizeMake(220.0f, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    
    return fmaxf(70.0f, sizeToFit.height + 45.0f);
}

#pragma mark - UIView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
    self.textLabel.frame = CGRectMake(70.0f, 10.0f, 240.0f, 20.0f);
    
    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0.0f, 25.0f);
    detailTextLabelFrame.size.height = [[self class] heightForCellWithPost:_article] - 45.0f;
    self.detailTextLabel.frame = detailTextLabelFrame;
}


@end
