//
//  ZDYNetworkRequest.m
//  ManView
//
//  Created by xia on 2017/1/19.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYNetworkRequest.h"
#import "LXNetworking.h"
#import "ZDYjiancheVO.h"


@interface ZDYNetworkRequest()

//网络请求类
@property (nonatomic, strong) LXURLSessionTask *task;

@end

@implementation ZDYNetworkRequest


#pragma mark -请求传入的参数
-(void)setParameter:(NSDictionary *)parameter{
    NSString *urlString = nil;
    switch (self.requestTag) {
        case ZDYNetworkRequestLogin:
            urlString = LOGIN_URL;
            break;
        case ZDYNetworkRequestCourseInfo:
            urlString = GET_COURSEINFO_URL;
            break;
        case ZDYNetworkRequestCheckcourse:
            urlString = COURSE_GONGNEN_URL;
            break;
        case ZDYNetworkRequestFaXian:
            urlString = REQUESTPUBLICURL;
            break;
        default:
            break;
    }
    if (self.requestTag != ZDYNetworkRequestFaXian) {
        [self qingqiuPost:parameter andUrl:urlString];
    }else{
        [self qingqiuGet:parameter andUrl:urlString];
    }
    
}

#pragma mark - post请求
- (void)qingqiuPost:(NSDictionary *)parameter andUrl:(NSString *)urlString{
    _task = [LXNetworking postWithUrl:urlString params:parameter success:^(NSDictionary *dic) {
        ZDYjiancheVO *vo = [[ZDYjiancheVO alloc] initWithDictionary:dic error:nil];
        if ([vo.errcode isEqualToString:@"0"]) {
            _returnSuccessData(dic);
        }else{
            [MBProgressHUD dissmiss];
            [ZDYUIAlertView jianDanAlertView:vo.errmsg];
        }
    } fail:^(NSError *error) {
        [ZDYUIAlertView jianDanAlertView:@"请求失败"];
        [MBProgressHUD dissmiss];
    } showHUD:NO];
}


#pragma mark - Get请求
- (void)qingqiuGet:(NSDictionary *)parameter andUrl:(NSString *)urlString{
    _task = [LXNetworking getWithUrl:urlString params:parameter success:^(NSDictionary *dic) {
        _returnSuccessData(dic);
    } fail:^(NSError *error) {
        [ZDYUIAlertView jianDanAlertView:@"请求失败"];
        [MBProgressHUD dissmiss];
    } showHUD:NO];
}



@end
