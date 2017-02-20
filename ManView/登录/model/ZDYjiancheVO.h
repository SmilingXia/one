//
//  ZDYjiancheVO.h
//  ManView
//
//  Created by xia on 2017/1/19.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "JSONModel.h"

@interface ZDYjiancheVO : JSONModel

/**
 *  返回代码 ，成功为0
 */
@property (nonatomic, strong) NSString<Optional> *errcode;

/**
 *  返回信息 ， 成功为ok
 */
@property (nonatomic, strong) NSString<Optional> *errmsg;

@end
