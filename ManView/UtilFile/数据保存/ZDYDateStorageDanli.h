//
//  ZDYDateStorageDanli.h
//  ManView
//
//  Created by xia on 2017/1/12.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZDYCourseCategoriesVO.h"
#import "ZDYUserLoginVO.h"

@interface ZDYDateStorageDanli : NSObject

#pragma mark -- 1️⃣单利的初始化方法
+ (ZDYDateStorageDanli *)initialization;

@property (nonatomic, strong) NSString *controllerViewTitle;



/**
 *  用户id
 */
@property (nonatomic, strong) NSString *uid;

/**
 *  sessionid
 */
@property (nonatomic, strong) NSString *sessionid;

/**
 *  登录时的用户信息
 */
@property (nonatomic, strong) ZDYUserLoginVO *loginUserInfo;


/**
 *  当前选择的门类
 */
@property (nonatomic, strong) ZDYCourseCategoriesVO *XZCourse;

/**
 *  当前选择课程的ID
 */
@property (nonatomic, strong) NSString *couresID;

@end
