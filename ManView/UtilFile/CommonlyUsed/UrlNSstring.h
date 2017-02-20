//
//  UrlNSstring.h
//  ManView
//
//  Created by xia on 2017/1/17.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlNSstring : NSObject

+ (NSString *)decodeFromPercentEscapeString:(NSString *)input;

@end
