//
//  ZDYEdsEncryption.h
//  ManView
//
//  Created by xia on 2017/1/19.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDYEdsEncryption : NSObject

//sha1加密
+(NSString *) sha1:(NSString *)input;

// 把一个byte数据转换为字符串
+(NSString *) parseByte2HexString:(Byte *) bytes;
// 把一个byte数组转换为字符串
+(NSString *) parseByteArray2HexString:(Byte[]) bytes;

// nsData 转16进制
+ (NSString*)stringWithHexBytes2:(NSData *)sender;

/****** 希望加密 *****/
//+ (NSString *)DESEncrypt:(NSString *)text WithKey:(NSString *)key;
//+ (NSString*)encrypt:(NSString*)plainText;


/****** 加密 ******/
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key;
/****** 解密 ******/
+(NSString *) decryptUseDES:(NSString *)plainText key:(NSString *)key;

@end
