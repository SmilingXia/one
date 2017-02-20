//
//  ZDYCourseCategoriesVO.h
//  ManView
//
//  Created by xia on 2017/1/13.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "JSONModel.h"
#import "UrlNSstring.h"

@protocol ZDYMenLeiVO

@end

@protocol ZDYCourseCategoriesVO

@end

@protocol ZDYCourseVO

@end


@interface ZDYMenLeiVO : JSONModel

/**
 *  错误代码
 */
@property (nonatomic, strong) NSString *errcode;
/**
 *  错误信息
 */
@property (nonatomic, strong) NSString *errmsg;

/**
 *  门类数组
 */
@property (nonatomic, strong) NSArray<ZDYCourseCategoriesVO> *bigclass;

@end

@interface ZDYCourseCategoriesVO :JSONModel

@property (nonatomic, strong) NSString *title;//考试门类名称

@property (nonatomic, strong) NSString *id;//考试门类ID

@property (nonatomic, strong) NSArray<ZDYCourseVO> *smallclass;//课程数组集合

@end

@interface ZDYCourseVO : JSONModel

@property (nonatomic, strong) NSString *id;//课程id;

@property (nonatomic, strong) NSString *title;//课程名称;

@end
