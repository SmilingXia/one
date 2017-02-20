//
//  ZDYUIAlertView.m
//  ManView
//
//  Created by xia on 2017/1/19.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYUIAlertView.h"

@interface ZDYUIAlertView()

@end

@implementation ZDYUIAlertView


+(void)jianDanAlertView:(NSString *)viewMsg{
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:nil message:viewMsg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertview show];
}



@end
