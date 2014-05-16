//
//  MainViewController.m
//  Q-Carp
//
//  Created by Jarvis.Tang on 14-1-20.
//  Copyright (c) 2014年 Jarvis.Tang. All rights reserved.
//

#import "MainViewController.h"
#import "Article.h"
#import "ArticleCell.h"

@interface MainViewController ()
{
    NSMutableArray *articles;
}
@end

@implementation MainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // navigation bar
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barTintColor = COLOR_DEFAULT;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    articles = [[NSMutableArray alloc]init];
    for (int i = 0; i < 10; i++) {
        Article *a = [[Article alloc]init];
        a.title = @"2013年全球TMT并购总额达5103亿美元，同比增长54.1%";
        a.author = @"TomLi";
        a.fetch_time = @"TomLi7小时前";
        a.art_imageUrl = @"http://img2.kuailiyu.com/uploadfile/2014/0121/thumb_201_135_20140121044559323.jpg";
        a.summary = @"2013年全球TMT并购总额高达5103亿美元，与2012年3311亿美元相比，同比增长54.1%，创自2006年以来并购总额最高值2013年全球TMT并购总额高达5103亿美元.";
        
        
        [articles addObject:a];
    }
    
    //refreshController
//    UIRefreshControl *refreshConteoller = [[UIRefreshControl alloc]init];
////    refreshConteoller addTarget:self action:<#(SEL)#> forControlEvents:<#(UIControlEvents)#>
//    self.refreshControl = refreshConteoller;
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [ArticleCell heightForCellWithPost:[articles objectAtIndex:indexPath.row]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[ArticleCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.article = [articles objectAtIndex:(NSUInteger)indexPath.row];
    
    return cell;
}



/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
