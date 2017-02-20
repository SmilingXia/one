//
//  ZDYCourseDictVO.h
//  ManView
//
//  Created by xia on 2017/1/24.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "JSONModel.h"
#import "UrlNSstring.h"


@protocol ZDYCourseDictVO

@end

@protocol ZDYCourseInfoVO

@end

@interface ZDYCourseDictVO : JSONModel

/**
 *
 */
@property (nonatomic, strong) NSString *errcode;

/**
 *
 */
@property (nonatomic, strong) NSString *errmsg;

/**
 *
 */
@property (nonatomic, strong) NSArray<ZDYCourseInfoVO> *courselist;

@end



@interface ZDYCourseInfoVO : JSONModel

/**
 *  子课程id
 */
@property (nonatomic, strong) NSString *categoryid;

/**
 *  id
 */
@property (nonatomic, strong) NSString *id;

/**
 *
 */
@property (nonatomic, strong) NSArray *package;

/**
 *  课程名称
 */
@property (nonatomic, strong) NSString *title;

@end
