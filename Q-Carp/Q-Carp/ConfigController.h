//
//  CNConfigController.h
//  Coin News
//
//  Created by 0day on 13-10-29.
//  Copyright (c) 2013年 coinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigController : NSObject

@property (nonatomic, assign, getter = isReadbilityEnabled) BOOL readbilityEnabled  DEPRECATED_ATTRIBUTE; // Default as NO. Bitell has update website for mobile devices.

// Resources
@property (nonatomic, readonly, copy) NSURL *appstoreURL;
@property (nonatomic, readonly, copy) NSString *flurryAppKey;
@property (nonatomic, readonly, copy) NSString *weixinAppKey;
@property (nonatomic, readonly, copy) NSString *articleHTMLPatternPath;

+ (instancetype)sharedController;

@end
