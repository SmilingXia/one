//
//  FBInputValidation.h
//  FundPractitioner
//
//  Created by xia on 16/6/5.
//  Copyright © 2016年 cn.bkw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBInputValidation : NSObject

+ (BOOL)isMobileNumber:(NSString *)mobileNum;
+ (BOOL)isEmpty:(NSString *)string;

@end
