//
//  XJFCommonmacro.h
//  ManView
//
//  Created by xia on 2017/1/4.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#ifndef XJFCommonmacro_h
#define XJFCommonmacro_h

//抽屉顶部距离 底部一样
#define ZDYScaleTopMargin 35
//抽屉拉出来右边剩余比例
#define ZDYZoomScaleRight 0.14

//状态栏的高度
#define STATUS_BAR_H 20
//导航栏的高度
#define NAVIGATION_BAR_H 44
//窗体的大小
#define SCREEN ([UIScreen mainScreen].bounds)
//屏幕的高度
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)
//屏幕的宽
#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
//内容的高度
#define CONTENT_H (SCREEN_H - STATUS_BAR_H - NAVIGATION_BAR_H)
//主窗体的代理
#define SharedDelegate  ((AppDelegate*)[UIApplication sharedApplication].delegate)

//自定义 cell时用的字体大小
#define ZDYNameFont [UIFont systemFontOfSize:13]
#define ZDYTextFont(a) [UIFont systemFontOfSize:a]
//自定义color
#define ZDYColor(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//做题界面计算高度时字体大小
#define LXJMTextFont [UIFont systemFontOfSize:17.0]
#define WEAK_SELF __weak typeof(self) weakSelf = self
#define STRONG_SELF __strong typeof(self) strongSelf = weakSelf

//加密的秘钥
#define PWKEY @"abc@2014"
//token
#define DL_TOKEN @"bangkaowang2014@bangkaowang"

//随机颜色
#define SUIJI_COLOR(a) [UIColor colorWithRed:(arc4random_uniform(256))/255.0 green:(arc4random_uniform(256))/255.0 blue:(arc4random_uniform(256))/255.0 alpha:a]




/**
 * 学习类型
 */
typedef enum {
    kUnitLearningTypeExplanation = 0,           //错题解析，全部解析
    kUnitLearningTypeExercise = 2,              //章节练习
    kUnitLearningTypeAppraisal = 3,             //章节测试
    kUnitLearningTypeTest = 5,                  //模拟测试
    kUnitLearningTypeStake = 6,                 //考前押题
    kUnitLearningTypeError = 7,                 //错题回顾
    kUnitLearningTypeKnowpoint = 17,            //考点精解
    kUnitLearningTypePastPaper = 11,            //历年真题
    kUnitLearningTypeFavorite = 12,             //收藏试题
    kUnitLearningTypeRecord = 13,               //笔记试题
    kUnitLearningTypeVideo = 14,                //视频精讲
    kUnitLearningTypeCrosstalk = 18,            //考前串讲
    kUnitLearningTypeExercises = 23,            //习题精讲
    kUnitLearningTypePublicCourse = 25,         //直播公开课
    kUnitLearningTypeFormalCourse = 26,         //直播正式课
    kUnitLearningTypeFree = 15,                 //免费试用
    kUnitLearningTypePractiseRandom = 16,       //随手练一练
    kUnitLearningTypeHistory = 100,             //学习历史
    kUnitLearningTypeMore                       //更多
}UnitLearningType;








/**
 *  网络接口
 */

//获取门类信息
#define KSML_URL @"http://api.bkw.cn/App/getcategory.ashx"

//用户登录
#define LOGIN_URL @"http://api.bkw.cn/App/login.ashx"

//根据门类获取课程列表中的课程
#define GET_COURSEINFO_URL @"http://api.bkw.cn/App/getcoursebycategory.ashx"

//根据课程id排查该课程的功能模块
#define COURSE_GONGNEN_URL @"http://api.bkw.cn/App/checkcourse_v7.ashx"



/**
 * accessToken -- 发现请求中的accessToken
 */
#define ACCESSTOKEN @"2.00NofgBD0L1k4pc584f79cc48SKGdD"

/**
 * 请求公共微博的网络接口
 */
#define REQUESTPUBLICURL @"https://api.weibo.com/2/statuses/public_timeline.json"

#define SOURCE @"source"
#define TOKEN @"access_token"
#define COUNT @"count"

#define STATUSES @"statuses"
#define CREATETIME @"created_at"
#define WEIBOID @"id"
#define WEIBOTEXT @"text"
#define USER @"user"
#define UID @"id"
#define HEADIMAGEURL @"profile_image_url"
#define USERNAME @"screen_name"










//通知宏
#define ZDY_GX_KECHENG_MENLEI        @"ZDY_GX_KECHENG_MENLEI" //点击门类时更新课程界面


#endif /* XJFCommonmacro_h */
