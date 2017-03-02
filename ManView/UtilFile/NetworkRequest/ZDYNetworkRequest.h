//
//  ZDYNetworkRequest.h
//  ManView
//
//  Created by xia on 2017/1/19.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJFCommonmacro.h"
#import "MBProgressHUD.h"
#import "ZDYUIAlertView.h"

typedef void(^ReturnSuccessData)(NSDictionary *);

typedef enum {
    ZDYNetworkRequestLogin = 0,             //登录
    ZDYNetworkRequestCourseInfo,            //课程信息
    ZDYNetworkRequestCheckcourse,           //检查课程页面信息
    ZDYNetworkRequestFaXian,                //发现
}NetworkRequestTag;


@interface ZDYNetworkRequest : NSObject

/**
 *  请求标签，用来区分各种请求
 */
@property (nonatomic, assign) NetworkRequestTag requestTag;

/**
 *  请求需传入的参数
 */
@property (nonatomic, strong) NSDictionary *parameter;

/**
 *  请求返回成功的数据
 */
@property (nonatomic, copy) ReturnSuccessData returnSuccessData;

@end
