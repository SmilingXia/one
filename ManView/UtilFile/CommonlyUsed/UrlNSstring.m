//
//  UrlNSstring.m
//  ManView
//
//  Created by xia on 2017/1/17.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "UrlNSstring.h"
#import "XJFCommonmacro.h"

@implementation UrlNSstring

/**
 * 功能；url中文解码
 * 需求：如果字符串中有+符号，把+转化为空格
 */
+ (NSString *)decodeFromPercentEscapeString:(NSString *)input {
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+" withString:@" " options:NSLiteralSearch range:NSMakeRange(0, [outputStr length])];
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


#pragma mark - 根据文字内容多少计算文本框高度
+ (CGFloat)labHeigth:(NSString *)content andFont:(UIFont *)viewfont andMargin:(float)margin{
    UIFont *viewfonts = [UIFont systemFontOfSize:20.0f];
    NSDictionary *attrs = @{NSFontAttributeName : viewfonts};
    CGSize maxSize = CGSizeMake(SCREEN_W - margin, MAXFLOAT);
    // 计算文字占据的高度
    CGSize size = [content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size.height;
}

@end
