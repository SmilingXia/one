//
//  ZDYNotificationCenter.h
//  ManView
//
//  Created by xia on 2017/1/17.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDYNotificationCenter : NSObject

/**
 * 点击门类时更新课程界面 通知
 */
+ (void)updateCourse:(NSDictionary *)ZDYCourseCategoriesVO;

@end
