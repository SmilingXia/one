//
//  FXDataSourceModel.h
//  ManView
//
//  Created by xia on 2017/3/2.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FXDataSourceModel : NSObject

@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *weiboId;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSURL    *imageUrl;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *text;

@end
