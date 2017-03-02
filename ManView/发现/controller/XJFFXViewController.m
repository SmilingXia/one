//
//  XJFFXViewController.m
//  ManView
//
//  Created by xia on 2017/1/6.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "XJFFXViewController.h"
#import "ZDYNetworkRequest.h"
#import "FXDataSourceModel.h"
#import "FXTableView.h"

@interface XJFFXViewController ()

@property (nonatomic, strong) FXTableView *fxTableview;

@property (nonatomic, strong) ZDYNetworkRequest *getFaXianRequest;

@end

@implementation XJFFXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.fxTableview = [[FXTableView alloc] initWithFrame:CGRectMake(0, -30, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
    self.fxTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.fxTableview];
    //获取数据
    [self getFaXianDataSource];
}

- (void)getFaXianDataSource{
    NSMutableDictionary *mudict = [NSMutableDictionary dictionary];
    [mudict setObject:ACCESSTOKEN forKey:TOKEN];
    [mudict setObject:@"30" forKey:COUNT];
    
    
    self.getFaXianRequest = [[ZDYNetworkRequest alloc] init];
    [MBProgressHUD showHUD];
    self.getFaXianRequest.requestTag = ZDYNetworkRequestFaXian;
    self.getFaXianRequest.parameter = mudict;
    WEAK_SELF;
    self.getFaXianRequest.returnSuccessData = ^(NSDictionary *dict){
        STRONG_SELF;
        [MBProgressHUD dissmiss];
        NSLog(@"请求成功后数据为：%@",dict);
        [strongSelf fetchValueSuccessWithDic:dict];
    };
}



#pragma 获取到正确的数据，对正确的数据进行处理
-(void)fetchValueSuccessWithDic:(NSDictionary *)returnValue
{
    //对从后台获取的数据进行处理，然后传给ViewController层进行显示
    NSArray *statuses = returnValue[STATUSES];
    NSMutableArray *publicModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    
    for (int i = 0; i < statuses.count; i ++) {
        FXDataSourceModel *publicModel = [[FXDataSourceModel alloc] init];
        
        //设置时间
        NSDateFormatter *iosDateFormater=[[NSDateFormatter alloc]init];
        iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
        
        //必须设置，否则无法解析
        iosDateFormater.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        NSDate *date=[iosDateFormater dateFromString:statuses[i][CREATETIME]];
        
        //目的格式
        NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        
        publicModel.date = [resultFormatter stringFromDate:date];
        publicModel.userName = statuses[i][USER][USERNAME];
        publicModel.text = statuses[i][WEIBOTEXT];
        publicModel.imageUrl = [NSURL URLWithString:statuses[i][USER][HEADIMAGEURL]];
        publicModel.userId = statuses[i][USER][UID];
        publicModel.weiboId = statuses[i][WEIBOID];
        
        [publicModelArray addObject:publicModel];
    }
    self.fxTableview.dataSourceArray = publicModelArray;
}


@end
