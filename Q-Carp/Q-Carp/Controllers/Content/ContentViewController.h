//
//  ContentViewController.h
//  Q-Carp
//
//  Created by Jarvis.Tang on 14-1-21.
//  Copyright (c) 2014年 Jarvis.Tang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"
@interface ContentViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *contentWebView;

@property(nonatomic,strong)Article *article;
@end
