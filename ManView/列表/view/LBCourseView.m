//
//  LBCourseView.m
//  ManView
//
//  Created by xia on 2017/1/23.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "LBCourseView.h"
#import "XJFCommonmacro.h"

@interface LBCourseView()<UIScrollViewDelegate>

@property (nonatomic, strong) UILabel *courseTitleLab;
@property (nonatomic, strong) UIButton *shutDownButton;//取消
@property (nonatomic, strong) UIButton *determineButton;//确定
@property (nonatomic, strong) UIScrollView *courseScrollView;

@property (nonatomic, strong) NSArray<ZDYCourseInfoVO> *courselist;
@property (nonatomic, strong) ZDYCourseInfoVO *courseInfo;
@property (nonatomic, assign) NSInteger firstIndex;

@end

@implementation LBCourseView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = ZDYColor(0, 208, 187, 1);
        [self loadSubView];
    }
    return self;
}

- (void)loadSubView{
    _shutDownButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    _shutDownButton.backgroundColor = ZDYColor(0, 208, 187, 1);
    _shutDownButton.tag =  onClickButtonTypeQX;
    [_shutDownButton addTarget:self action:@selector(butOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [_shutDownButton setImage:[UIImage imageNamed:@"courseinfo_quxiao"] forState:UIControlStateNormal];
    [self addSubview:_shutDownButton];
    
    UIView *leftview = [[UIView alloc] initWithFrame:CGRectMake(30, 0, 1, 30)];
    leftview.backgroundColor = [UIColor whiteColor];
    [self addSubview:leftview];
    
    _courseTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(31, 0, SCREEN_W - 62, 30)];
    _courseTitleLab.text = @"课程名称";
    _courseTitleLab.textAlignment = NSTextAlignmentCenter;
    _courseTitleLab.textColor = [UIColor whiteColor];
    _courseTitleLab.backgroundColor = ZDYColor(0, 208, 187, 1);
    _courseTitleLab.font = LXJMTextFont;
    [self addSubview:_courseTitleLab];
    
    UIView *rightview = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_W - 31, 0, 1, 30)];
    rightview.backgroundColor = [UIColor whiteColor];
    [self addSubview:rightview];
    
    _determineButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_W - 30, 0, 30, 30)];
    _determineButton.backgroundColor = ZDYColor(0, 208, 187, 1);
    _determineButton.tag = onClickButtonTypeQD;
    [_determineButton addTarget:self action:@selector(butOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [_determineButton setImage:[UIImage imageNamed:@"courseinfo_xuanzhe"] forState:UIControlStateNormal];
    [self addSubview:_determineButton];
    
    
    UIView *hengxian = [[UIView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_W, 1)];
    hengxian.backgroundColor = [UIColor whiteColor];
    [self addSubview:hengxian];
    
    
    _courseScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 31, SCREEN_W, 119)];
    _courseScrollView.backgroundColor = [UIColor redColor];
    [self addSubview:_courseScrollView];
    _courseScrollView.delegate = self;
    _courseScrollView.bounces = NO;
    _courseScrollView.pagingEnabled = YES;
    _courseScrollView.showsHorizontalScrollIndicator = NO;
}


- (void)butOnclick:(UIButton *)sender{
    self.buttonReturn(sender.tag,_firstIndex);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 获取当前处于显示范围内的图片的索引
    CGRect visibleBounds = _courseScrollView.bounds;
    
    NSLog(@"%f",visibleBounds.origin.x);
    
    CGFloat minX = CGRectGetMinX(visibleBounds);
    CGFloat width = CGRectGetWidth(visibleBounds);
    
    _firstIndex = (NSInteger)floorf(minX / width);
    
    NSLog(@"当前%ld",_firstIndex);
    
    _courseInfo = [_courseDict.courselist objectAtIndex:_firstIndex];
    _courseTitleLab.text = _courseInfo.title;
}


- (void)setCourseDict:(ZDYCourseDictVO *)courseDict{
    if (courseDict == nil) {
        return;
    }
    _firstIndex = 0;
    _courseDict = courseDict;
    _courseScrollView.contentOffset = CGPointMake(0, 0);
    _courseScrollView.contentSize = CGSizeMake(SCREEN_W*_courseDict.courselist.count, 119);
    _courselist = _courseDict.courselist;
    _courseInfo = [_courselist objectAtIndex:0];
    _courseTitleLab.text = _courseInfo.title;
    for (int i = 1; i<=courseDict.courselist.count; i++ ) {
        UIView *lbview = [[UIView alloc]init];
        lbview.frame = CGRectMake((i-1)*SCREEN_W, 0, SCREEN_W, 119);
        lbview.backgroundColor = SUIJI_COLOR(1);
        [_courseScrollView addSubview:lbview];
    }
}





@end
