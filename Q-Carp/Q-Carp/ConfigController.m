//
//  CNConfigController.m
//  Coin News
//
//  Created by 0day on 13-10-29.
//  Copyright (c) 2013年 coinfo. All rights reserved.
//

#import "ConfigController.h"

#define ReadbilityEnabledKey            @"ReadbilityEnabled"
#define kDefaultReadbilityEnabledValue  NO

@implementation ConfigController

+ (instancetype)sharedController {
    static ConfigController *s_controller;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_controller = [[self alloc] init];
    });
    
    return s_controller;
}

- (id)init {
    self = [super init];
    if (self) {
        NSNumber *isEnabledNumber = [[NSUserDefaults standardUserDefaults] valueForKey:ReadbilityEnabledKey];
        if (isEnabledNumber) {
            _readbilityEnabled = [isEnabledNumber boolValue];
        } else {
            _readbilityEnabled = kDefaultReadbilityEnabledValue;
        }
        
    }
    return self;
}

#pragma mark - Property Accessor

- (void)setReadbilityEnabled:(BOOL)readbilityEnabled {
    [self willChangeValueForKey:@"readbilityEnabled"];
    
    _readbilityEnabled = readbilityEnabled;
    
    [[NSUserDefaults standardUserDefaults] setBool:readbilityEnabled forKey:ReadbilityEnabledKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self didChangeValueForKey:@"readbilityEnabled"];
}

- (NSURL *)appstoreURL {
    return [NSURL URLWithString:@"http://itunes.apple.com/cn/app/Coin-News/id735770918?mt=8"];
}

- (NSString *)flurryAppKey {
    return @"RYGSZMXBZNY8BM2DKQX7";
}

- (NSString *)weixinAppKey {
    return @"wx8cddad9d2ff8ead8";
}

- (NSString *)articleHTMLPatternPath {
    static NSString *s_path;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (UIUserInterfaceIdiomPhone == UI_USER_INTERFACE_IDIOM()) {
            s_path = [[NSBundle mainBundle] pathForResource:@"view" ofType:@"html"];
        } else {
            s_path = [[NSBundle mainBundle] pathForResource:@"view_pad" ofType:@"html"];
        }
    });
    
    return s_path;
}

@end
