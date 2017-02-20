//
//  ZDYViewController.m
//  ManView
//
//  Created by xia on 2017/1/6.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYViewController.h"
#import "XJFCommonmacro.h"
#import "UIBarButtonItem+ZDYBarButtonItem.h"

@interface ZDYViewController ()

@end

@implementation ZDYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏左右两边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithNormalImage:@"search_icon_white_6P@2x" target:self action:@selector(leftSearchClick)];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithNormalImage:@"artcleList_btn_info_6P" target:self action:@selector(rightClick)];
    
    self.view.backgroundColor = ZDYColor(239, 239, 244, 1);
}

#pragma 导航条左右边按钮点击
- (void)rightClick
{
    //添加遮盖,拦截用户操作
    _coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _coverBtn.frame = self.navigationController.view.bounds;
    [_coverBtn addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:_coverBtn];
    
    //缩放比例
    CGFloat zoomScale = (SCREEN_H - ZDYScaleTopMargin * 2) / SCREEN_H;
    //X移动距离
    CGFloat moveX = SCREEN_W - SCREEN_W * ZDYZoomScaleRight;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        CGAffineTransform transform = CGAffineTransformMakeScale(zoomScale, zoomScale);
        //先缩放在位移会使位移缩水,正常需要moveX/zoomScale 才是正常的比例,这里感觉宽度还好就省略此步
        self.navigationController.view.transform = CGAffineTransformTranslate(transform, moveX, 0);
        //将状态改成已经缩放
        self.isScale = YES;
    }];
}

//推出search控制器
- (void)leftSearchClick
{
    
}

//cover点击
- (void)coverClick
{
    [UIView animateWithDuration:0.3 animations:^{
        self.navigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.coverBtn removeFromSuperview];
        self.coverBtn = nil;
        self.isScale = NO;
        //当遮盖按钮被销毁时调用
        if (_coverDidRomove) {
            _coverDidRomove();
        }
    }];
}


@end
