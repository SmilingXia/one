//
//  LBSCrollViewAN.m
//  ManView
//
//  Created by xia on 2017/1/17.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "LBSCrollViewAN.h"
#import "XJFCommonmacro.h"
#import "ANView.h"
#import "XJFCourseButtonData.h"

@interface LBSCrollViewAN()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation LBSCrollViewAN

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.bounces = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor = ZDYColor(239, 239, 244, 1);
    }
    return self;
}

//有数据视图 -- 显示课程
- (void)loadSubviewYouKC{
    float anviewW = 70;
    float anviewH = 110;
    float marginX = (SCREEN_W - 3*anviewW)/4;
    float marginY = 20.0f;
    CGFloat scrollContentSize = 0.0;
    for (int index = 0; index < _XJFCourseCategoriesVO.smallclass.count; index++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"lb_%d_coures@2x",(index%5)]];
        ZDYCourseVO *courseVO = [_XJFCourseCategoriesVO.smallclass objectAtIndex:index];
        ANView *anview = [[ANView alloc] initWithFrame:CGRectMake(marginX + index%3 *(anviewW + marginX), marginY + index/3 *(anviewH + marginY), anviewW, anviewH)];
        scrollContentSize = CGRectGetMaxY(anview.frame);
        anview.couresName = courseVO.title;
        anview.couresButimg = image;
        anview.tag = 2000+index;
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick:)];
        tap.delegate  = self;
        [anview addGestureRecognizer:tap];
        
        [self addSubview:anview];
    }
    self.contentSize = CGSizeMake(SCREEN_W, scrollContentSize + 20);
}

//无数据视图
- (void)loadSubviewWu{
    CGRect wuShujuRect = self.bounds;
    UILabel *wuShujuLab = [[UILabel alloc] initWithFrame:CGRectMake(0, (wuShujuRect.size.height - 30)/2, SCREEN_W, 30)];
    [self addSubview:wuShujuLab];
    wuShujuLab.font = [UIFont systemFontOfSize:18.0f];
    wuShujuLab.text = @"该类还未添加课程";
    wuShujuLab.textAlignment = NSTextAlignmentCenter;
    wuShujuLab.textColor = [UIColor grayColor];
    self.contentSize = CGSizeMake(SCREEN_W, wuShujuRect.size.height);
}

- (void)setXJFCourseCategoriesVO:(ZDYCourseCategoriesVO *)XJFCourseCategoriesVO{
    _XJFCourseCategoriesVO = XJFCourseCategoriesVO;
    //移除所有的子视图
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _viewTypeInfo = viewTypeInfoKC;
    if (XJFCourseCategoriesVO.smallclass.count<1) {
        [self loadSubviewWu];
    }else{
        [self loadSubviewYouKC];
    }
}

- (void)loadSubviewYouMK{
    float anviewW = 70;
    float anviewH = 110;
    float marginX = (SCREEN_W - 3*anviewW)/4;
    float marginY = 20.0f;
    CGFloat scrollContentSize = 0.0;
    for (int index = 0; index < _courseMokuai.count; index++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"lb_%d_coures@2x",(index%5)]];
        
        XJFCourseButtonData *vo = [_courseMokuai objectAtIndex:index];
        ANView *anview = [[ANView alloc] initWithFrame:CGRectMake(marginX + index%3 *(anviewW + marginX), marginY + index/3 *(anviewH + marginY), anviewW, anviewH)];
        scrollContentSize = CGRectGetMaxY(anview.frame);
        anview.couresName = vo.btnName;
        anview.couresButimg = image;
        anview.tag = 2000+index;
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick:)];
        tap.delegate  = self;
        [anview addGestureRecognizer:tap];
        
        [self addSubview:anview];
    }
    self.contentSize = CGSizeMake(SCREEN_W, scrollContentSize + 20);
}


- (void)setCourseMokuai:(NSMutableArray *)courseMokuai{
    _courseMokuai = courseMokuai;

    _viewTypeInfo = viewTypeInfoMK;
    if (courseMokuai.count < 1) {
        [self loadSubviewWu];
    }else{
        [self loadSubviewYouMK];
    }
}

- (void)viewClick:(UITapGestureRecognizer *)tap{
    NSLog(@"点击的视图值为：%ld",tap.view.tag);
    _anTouchEvent(tap.view.tag - 2000);
}


@end
