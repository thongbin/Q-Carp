//
//  ContentViewController.m
//  Q-Carp
//
//  Created by Jarvis.Tang on 14-1-21.
//  Copyright (c) 2014年 Jarvis.Tang. All rights reserved.
//

#import "ContentViewController.h"
#import "ConfigController.h"
#import "TFHpple.h"

@interface ContentViewController ()
-(void)loadHtmlView;
@end

@implementation ContentViewController

-(void)loadHtmlView{
        NSString *urlString = _article.contentUrl;
        
        NSMutableString *htmlString = [[NSString stringWithContentsOfFile:[ConfigController sharedController].articleHTMLPatternPath
                                                                 encoding:NSUTF8StringEncoding
                                                                    error:nil] mutableCopy];
        [htmlString replaceOccurrencesOfString:@"**[title]**"
                                    withString:self.article.title
                                       options:0
                                         range:NSMakeRange(0, htmlString.length)];
        
        [htmlString replaceOccurrencesOfString:@"**[domain]**"
                                    withString:NSLocalizedString(@"信息来源", nil)
                                       options:0
                                         range:NSMakeRange(0, htmlString.length)];
        
        [htmlString replaceOccurrencesOfString:@"**[link]**"
                                    withString:_article.contentUrl
                                       options:0
                                         range:NSMakeRange(0, htmlString.length)];
        NSString *targetFontSize = [NSString stringWithFormat:@"%i%%", 100];
        [htmlString replaceOccurrencesOfString:@"**[txtadjust]**"
                                    withString:targetFontSize
                                       options:0
                                         range:NSMakeRange(0, htmlString.length)];
        
        [_contentWebView loadHTMLString:htmlString baseURL:nil];;
        
        __weak typeof(self) weakSelf = self;
        
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                                   TFHpple *htmlDoc = [[TFHpple alloc] initWithData:data isXML:NO];
                                   
//                                   NSString *url = nil;
//                                   NSArray *sourceElements = [htmlDoc searchWithXPathQuery:@"//span[@class='comhead']"];
//                                   if (sourceElements.count) {
//                                       TFHppleElement *sourceElement = sourceElements[0];
//                                       TFHppleElement *urlElement = [sourceElement firstChildWithClassName:@"tooltip"];
//                                       url = urlElement.attributes[@"href"];
//                                   }
//                                   
//                                   NSString *domain = [[NSURL URLWithString:url] host];
//                                   if (nil == domain) {
//                                       domain = [[NSURL URLWithString:URL_BITELL_FEED] host];
//                                   }
                                   
                                   [htmlString replaceOccurrencesOfString:NSLocalizedString(@"信息来源", nil)
                                                               withString:@"http://www.kuailiyu.com/"
                                                                  options:0
                                                                    range:NSMakeRange(0, htmlString.length)];
                                   
                                   NSArray *articleElements = [htmlDoc searchWithXPathQuery:@"//div[@id='text']"];
                                   TFHppleElement *articleElement = articleElements[0];
                                   
                                   NSString *clearReadDocument = [htmlString stringByReplacingOccurrencesOfString:@"加载中...  "
                                                                                                       withString:articleElement.raw
                                                                                                          options:0
                                                                                                            range:NSMakeRange(0, htmlString.length)];
                                   
                                   [weakSelf.contentWebView loadHTMLString:clearReadDocument baseURL:nil];
                               }];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = _article.title;
    
    //navBar setting
    self.navigationController.navigationBar.barTintColor = COLOR_DEFAULT;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = YES;
    
	// Do any additional setup after loading the view.
    [self loadHtmlView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
