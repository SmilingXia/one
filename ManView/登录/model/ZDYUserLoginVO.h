//
//  ZDYUserLoginVO.h
//  ManView
//
//  Created by xia on 2017/1/19.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "JSONModel.h"

@interface ZDYUserLoginVO : JSONModel


/**
 *  返回代码，0成功
 */
@property (nonatomic, strong) NSString *errcode;

/**
 *  返回信息，ok成功
 */
@property (nonatomic, strong) NSString *errmsg;

/**
 *  联系人
 */
@property (nonatomic, strong) NSString *linkman;

/**
 *  昵称
 */
@property (nonatomic, strong) NSString *nickname;

/**
 *  sessionID
 */
@property (nonatomic, strong) NSString *sessionid;

/**
 *  用户ID
 */
@property (nonatomic, strong) NSString *uid;

/**
 *  用户账号
 */
@property (nonatomic, strong) NSString *username;


@end
