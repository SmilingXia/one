//
//  XJFCourseinfoVC.m
//  ManView
//
//  Created by xia on 2017/1/20.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#define COURSE_INFO_VIEW_H SCREEN_H * 0.6
#define COURSE_INFO_VIEW_W SCREEN_W * 0.6
#define LEFT_BIANJU (SCREEN_W - COURSE_INFO_VIEW_W)/2
#define TOP_BIANJU (CONTENT_H - COURSE_INFO_VIEW_H)/2


#import "XJFCourseinfoVC.h"
#import "XJFCommonmacro.h"
#import "ZDYNetworkRequest.h"
#import "ZDYDateStorageDanli.h"
#import "MBProgressHUD.h"
#import "ZDYCheckcourseVO.h"
#import "XJFCourseButtonData.h"
#import "LBSCrollViewAN.h"

@interface XJFCourseinfoVC ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *courseInfoView;

@property (nonatomic, strong) ZDYNetworkRequest *getCheckcourseRequest;

@property (nonatomic, strong) ZDYCheckcourseVO *checkCourseVO;

@property (nonatomic, strong) NSMutableArray *courseMokuai;

@property (nonatomic, strong) LBSCrollViewAN *lbSCrollViewAN;

@property (nonatomic, strong) UIView *examinationView;

@end

@implementation XJFCourseinfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZDYColor(239, 239, 244, 1);
    self.title = self.courseInfoVO.title;
    self.rightShow = YES;
    [self loadSubView];
    //请求课程页面信息
    [self getCheckcourse];
}

//右边更多菜单按钮
- (void)rightBarClick{
    NSLog(@"");
}

- (void)loadSubView{
    //检查是否可以免费学习，可以显示升级 ，已经购买不提示
    self.examinationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 50)];
    [self.view addSubview:self.examinationView];
    UILabel *leftLab = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_W/2 - 100, 10, 100, 30)];
    [self.examinationView addSubview:leftLab];
    leftLab.font = ZDYTextFont(16);
    leftLab.text = @"升级VIP，";
    leftLab.textColor = [UIColor blueColor];
    leftLab.textAlignment = NSTextAlignmentRight;
    
    
    UILabel *rightLab = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_W/2, 10, SCREEN_W/2, 30)];
    [self.examinationView addSubview:rightLab];
    rightLab.font = ZDYTextFont(16);
    rightLab.text = @"体验更多功能";
    rightLab.textAlignment = NSTextAlignmentLeft;
    
    
    
    
    //实现模块
    self.lbSCrollViewAN = [[LBSCrollViewAN alloc] initWithFrame:CGRectMake(0, 50, SCREEN_W, SCREEN_H- 110)];
    [self.view addSubview:self.lbSCrollViewAN];
    WEAK_SELF;
    self.lbSCrollViewAN.anTouchEvent = ^(NSInteger index){
        STRONG_SELF;
        XJFCourseButtonData *dataVO = [strongSelf.courseMokuai objectAtIndex:index];
        NSLog(@"%@",dataVO);
    };
}


- (void)getCheckcourse{
    NSMutableDictionary *mudict = [NSMutableDictionary dictionary];
//    [mudict setObject:[ZDYDateStorageDanli initialization].sessionid forKey:@"sessionid"];
//    [mudict setObject:[ZDYDateStorageDanli initialization].uid forKey:@"uid"];
//    [mudict setObject:@"" forKey:@"ip"];
    [mudict setObject:self.courseInfoVO.id forKey:@"courseid"];

    
    self.getCheckcourseRequest = [[ZDYNetworkRequest alloc] init];
    [MBProgressHUD showHUD];
    self.getCheckcourseRequest.requestTag = ZDYNetworkRequestCheckcourse;
    self.getCheckcourseRequest.parameter = mudict;
    WEAK_SELF;
    self.getCheckcourseRequest.returnSuccessData = ^(NSDictionary *dict){
        STRONG_SELF;
        [MBProgressHUD dissmiss];
        strongSelf.checkCourseVO = [[ZDYCheckcourseVO alloc] initWithDictionary:dict error:nil];
        NSLog(@"请求成功后数据为：%@",strongSelf.checkCourseVO.errcode);
        //添加按钮功能模块
        [strongSelf resetHomeBtnArray];
        strongSelf.lbSCrollViewAN.courseMokuai = strongSelf.courseMokuai;
        //布局按钮
    };
}


#pragma mark - 添加可用的模块
- (NSMutableArray *)resetHomeBtnArray {
    _courseMokuai = [[NSMutableArray alloc] init];
    
    XJFCourseButtonData *dataVO = [[XJFCourseButtonData alloc] init];
    
    if (self.checkCourseVO.m16.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypePractiseRandom;
        dataVO.btnName = @"随手练一练";
        dataVO.btnImgName = @"home_practise_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    if (self.checkCourseVO.m2.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeExercise;
        dataVO.btnName = @"章节练习";
        dataVO.btnImgName = @"home_exercise_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    if (self.checkCourseVO.m3.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeAppraisal;
        dataVO.btnName = @"章节测试";
        dataVO.btnImgName = @"home_appraisal_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    if (self.checkCourseVO.m7.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeError;
        dataVO.btnName = @"错题回顾";
        dataVO.btnImgName = @"home_error_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    if (self.checkCourseVO.m5.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeTest;
        dataVO.btnName = @"模拟测试";
        dataVO.btnImgName = @"home_test_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    if (self.checkCourseVO.m17.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeKnowpoint;
        dataVO.btnName = @"考点精解";
        dataVO.btnImgName = @"home_jingjiang_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    
    if (self.checkCourseVO.m11.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypePastPaper;
        dataVO.btnName = @"历年真题";
        dataVO.btnImgName = @"home_pastPaper_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    
    if (self.checkCourseVO.m6.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeStake;
        dataVO.btnName = @"考前押题";
        dataVO.btnImgName = @"home_stake_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    
    if (self.checkCourseVO.m14.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeVideo;
        dataVO.btnName = @"视频精讲";
        dataVO.btnImgName = @"home_video_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    
    if (self.checkCourseVO.m18.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeCrosstalk;
        dataVO.btnName = @"考前串讲";
        dataVO.btnImgName = @"home_crosstalk_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    if (self.checkCourseVO.m23.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeExercises;
        dataVO.btnName = @"习题精讲";
        dataVO.btnImgName = @"home_exercises_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    if (self.checkCourseVO.m25.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypePublicCourse;
        dataVO.btnName = @"公开课";
        dataVO.btnImgName = @"home_publiccourse_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    if (self.checkCourseVO.m26.boolValue){
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeFormalCourse;
        dataVO.btnName = @"直播课程";
        dataVO.btnImgName = @"home_formalcourse_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    if (self.checkCourseVO.m30.boolValue) {
        dataVO = [[XJFCourseButtonData alloc] init];
        dataVO.btnType = kUnitLearningTypeFormalCourse;
        dataVO.btnName = @"猜你会错";
        dataVO.btnImgName = @"home_formalcourse_icon@2x";
        [_courseMokuai addObject:dataVO];
    }
    return _courseMokuai;
}

@end
