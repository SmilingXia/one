//
//  ANView.m
//  ManView
//
//  Created by xia on 2017/1/17.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//
#define labH 40
#define butBJ 5

#import "ANView.h"
#import "XJFCommonmacro.h"
#import "ZDYimageType.h"

@interface ANView()

@property (nonatomic, strong) UIButton *couresBut;

@property (nonatomic, strong) UILabel *couresLab;

@end

@implementation ANView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self loadSubView];
    }
    return self;
}

- (void)loadSubView{
    CGRect viewBounds = self.bounds;
    CGSize viewSize = viewBounds.size;
    float butW = viewSize.width;
    self.couresBut = [UIButton buttonWithType:UIButtonTypeCustom];
    self.couresBut.frame = CGRectMake(0,0,butW, viewSize.height - labH);
    self.couresBut.layer.mask = [ZDYimageType quanYuanjiao:self.couresBut.bounds];
    self.couresBut.userInteractionEnabled = NO;
    [self addSubview:self.couresBut];
    
    self.couresLab = [[UILabel alloc] initWithFrame:CGRectMake(0, viewSize.height - labH, viewSize.width, labH)];
    [self addSubview:self.couresLab];
    self.couresLab.textAlignment = NSTextAlignmentCenter;
    self.couresLab.textColor = [UIColor darkGrayColor];
    self.couresLab.font = [UIFont systemFontOfSize:12.0f];
    self.couresLab.numberOfLines = 0;
}

- (void)setCouresName:(NSString *)couresName{
    _couresName = couresName;
    self.couresLab.text = couresName;
}

-(void)setCouresButimg:(UIImage *)couresButimg{
    self.couresBut.backgroundColor = [UIColor grayColor];
    [self.couresBut setBackgroundImage:couresButimg forState:UIControlStateNormal];
//    [self.couresBut setImage:couresButimg forState:UIControlStateNormal];
}





//    self.courseInfoView = [[UIView alloc] initWithFrame:CGRectMake(LEFT_BIANJU , TOP_BIANJU*3,COURSE_INFO_VIEW_W , COURSE_INFO_VIEW_H)];
//    [self.view addSubview:self.courseInfoView];
//    self.courseInfoView.backgroundColor = ZDYColor(239, 239, 244, 1);
//
//    self.courseInfoView.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.courseInfoView.layer.shadowOffset = CGSizeMake(-4,4);
//    self.courseInfoView.layer.shadowRadius = 4.0f;
//    self.courseInfoView.layer.shadowOpacity = 0.8;//阴影透明度，默认0
//
//    self.courseInfoView.layer.anchorPoint = CGPointMake(0.5, 1);
//
//    //创建手势
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(huaDong:)];
//    pan.delegate = self;
//    //添加手势
//    [self.courseInfoView addGestureRecognizer:pan];


//- (void)huaDong:(UIPanGestureRecognizer *)pan{
//    
//    //平移手势在指定视图的坐标系中的平移。
//    CGFloat moveX = [pan translationInView:self.view].x;
//    
//    //旋转的弧度 （moveX小于0往左滑动 - 逆时针） （moveX大于0往右滑动 - 顺时针）
//    float jiaodu = moveX/(SCREEN_W - LEFT_BIANJU);
//    
//    [UIView animateWithDuration:0.1 animations:^{
//        
//        CGAffineTransform transform = CGAffineTransformMakeRotation(jiaodu);
//        transform = CGAffineTransformTranslate(transform, 0, 0);
//        self.courseInfoView.transform = transform;
//    }];
//    
//    //当手势停止的时候,判断X轴的移动距离，停靠
//    if (pan.state == UIGestureRecognizerStateEnded) {
//        if (fabsf(jiaodu) < M_PI_4/2) {
//            self.courseInfoView.transform = CGAffineTransformIdentity;
//        }
//    }
//    
//}

@end
