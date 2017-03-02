//
//  XJFLBViewController.m
//  ManView
//
//  Created by xia on 2017/1/6.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "XJFLBViewController.h"
#import "XJFCommonmacro.h"
#import "ZDYCourseCategoriesVO.h"
#import "ZDYDateStorageDanli.h"
#import "LBSCrollViewLB.h"
#import "LBSCrollViewAN.h"
#import "ZDYNotificationCenter.h"
#import "XJFCourseinfoVC.h"
#import "LBCourseView.h"
#import "AppDelegate.h"
#import "ZDYNetworkRequest.h"
#import "MBProgressHUD.h"
#import "ZDYCourseDictVO.h"

@interface XJFLBViewController ()

@property (nonatomic, strong) LBSCrollViewLB *lbScrollViewLB;

@property (nonatomic, strong) LBSCrollViewAN *lbSCrollViewAN;

@property (nonatomic, strong) ZDYCourseCategoriesVO *XJFCourseCategoriesVO;

@property (nonatomic, strong) ZDYCourseVO *XJFCourseVO;

@property (nonatomic, strong) LBCourseView *courseView;

@property (nonatomic, strong) UIView *zheZhaoView;

@property (nonatomic, strong) ZDYNetworkRequest *getCouresRequest;
@property (nonatomic, strong) ZDYCourseDictVO *courseDict;


@end

@implementation XJFLBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //实现更新课程的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCourseShixian:) name:ZDY_GX_KECHENG_MENLEI object:nil];
    self.XJFCourseCategoriesVO = [ZDYDateStorageDanli initialization].XZCourse;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self lastSubView];
}

- (void)lastSubView{

    //1.界面轮播欣赏图片
    self.lbScrollViewLB = [[LBSCrollViewLB alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H/3)];
    [self.view addSubview:self.lbScrollViewLB];
    self.lbScrollViewLB.XJFCourseCategoriesVO = [ZDYDateStorageDanli initialization].XZCourse;
    
    //显示精选课程项
    UILabel *titleLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_H/3, SCREEN_W, 50)];
    [self.view addSubview:titleLabelView];
    titleLabelView.backgroundColor = ZDYColor(0, 208, 187, 1);
    titleLabelView.text = @"精选考试";
    titleLabelView.textAlignment = NSTextAlignmentCenter;
    titleLabelView.font = ZDYTextFont(20);
    titleLabelView.textColor = [UIColor whiteColor];
    
    //2.相关学习课程
    self.lbSCrollViewAN = [[LBSCrollViewAN alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabelView.frame), SCREEN_W, SCREEN_H - CGRectGetMaxY(titleLabelView.frame) - 60)];
    [self.view addSubview:self.lbSCrollViewAN];
    self.lbSCrollViewAN.XJFCourseCategoriesVO = [ZDYDateStorageDanli initialization].XZCourse;
    WEAK_SELF;
    self.lbSCrollViewAN.anTouchEvent = ^(NSInteger index){
        STRONG_SELF;
        strongSelf.XJFCourseVO = [strongSelf.XJFCourseCategoriesVO.smallclass objectAtIndex:index];
        //获取数据
        [strongSelf getCouresInfo:strongSelf.XJFCourseVO.id];
        
        
        //显示数据
        [UIView animateWithDuration:0.3 animations:^{
            strongSelf.courseView.frame = CGRectMake(0,SCREEN_H - 150, SCREEN_W, 150);
            //让其遮罩显示
            strongSelf.zheZhaoView.hidden = NO;
        }];
    };
    
    [self showMask];
}


- (void)getCouresInfo:(NSString *)categoryid{
    
    NSMutableDictionary *mudict = [NSMutableDictionary dictionary];
    [mudict setObject:categoryid forKey:@"categoryid"];
    
    self.getCouresRequest = [[ZDYNetworkRequest alloc] init];
    [MBProgressHUD showHUD];
    self.getCouresRequest.requestTag = ZDYNetworkRequestCourseInfo;
    self.getCouresRequest.parameter = mudict;
    WEAK_SELF;
    self.getCouresRequest.returnSuccessData = ^(NSDictionary *dict){
        STRONG_SELF;
        [MBProgressHUD dissmiss];
        NSLog(@"请求成功后数据为：%@",dict);
        strongSelf.courseDict = [[ZDYCourseDictVO alloc] initWithDictionary:dict error:nil];
        strongSelf.courseView.courseDict = strongSelf.courseDict;
    };
}

//创建遮罩
- (void)showMask{
    
    self.zheZhaoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    self.zheZhaoView.backgroundColor = [UIColor blackColor];
    self.zheZhaoView.alpha = 0.3;
    self.zheZhaoView.hidden = YES;
    [SharedDelegate.window.layer addSublayer:self.zheZhaoView.layer];
    
    //显示当前考试的全部课程
    self.courseView = [[LBCourseView alloc] initWithFrame:CGRectMake(0,SCREEN_H, SCREEN_W, 150)];
    [SharedDelegate.window.layer addSublayer:self.courseView.layer];
    WEAK_SELF;
    self.courseView.buttonReturn = ^(onClickButtonType type, NSInteger indexTeger){
        STRONG_SELF;
        switch (type) {
            case onClickButtonTypeQX:
                
                strongSelf.zheZhaoView.hidden = YES;
                strongSelf.courseView.frame = CGRectMake(0,SCREEN_H, SCREEN_W, 150);
                strongSelf.courseView.courseDict = nil;
                break;
                
            case onClickButtonTypeQD:
                
                strongSelf.zheZhaoView.hidden = YES;
                strongSelf.courseView.frame = CGRectMake(0,SCREEN_H, SCREEN_W, 150);
                XJFCourseinfoVC *civc = [[XJFCourseinfoVC alloc] init];
                ZDYCourseInfoVO *courseInfoVO=[strongSelf.courseDict.courselist objectAtIndex:indexTeger];
                civc.courseInfoVO = courseInfoVO;
                [strongSelf.navigationController pushViewController:civc animated:YES];
                break;
        }
    };
}


-(void)updateCourseShixian:(NSNotification *)sender{
    NSMutableDictionary *datiinfo = [NSMutableDictionary dictionaryWithDictionary:[sender userInfo]];
    self.XJFCourseCategoriesVO = nil;
    self.XJFCourseCategoriesVO = [datiinfo objectForKey:@"ZDYCourseCategoriesVO"];
    self.lbScrollViewLB.XJFCourseCategoriesVO = nil;
    self.lbScrollViewLB.XJFCourseCategoriesVO = [datiinfo objectForKey:@"ZDYCourseCategoriesVO"];
    self.lbSCrollViewAN.XJFCourseCategoriesVO = nil;
    self.lbSCrollViewAN.XJFCourseCategoriesVO = [datiinfo objectForKey:@"ZDYCourseCategoriesVO"];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:ZDY_GX_KECHENG_MENLEI];
}

@end
