//
//  MainViewController.m
//  ManView
//
//  Created by xia on 2017/1/4.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "MainViewController.h"
#import "XJFCommonmacro.h"
#import "ZDYDateStorageDanli.h"
#import "LeftMainView.h"
#import "ZDYNavigationController.h"
#import "ZDYViewController.h"
#import "XJFSYViewController.h"
#import "XJFFXViewController.h"
#import "XJFXXViewController.h"
#import "XJFSZViewController.h"
#import "XJFLBViewController.h"

@interface MainViewController ()<ZDYLeftMenuViewDelegate,UIGestureRecognizerDelegate>

//左边显示的主菜单
@property (nonatomic, strong) UIView *LeftMainView;

//记录当前显示的控制器，用于添加手势拖拽
@property (nonatomic, strong) ZDYViewController *showViewController;

@property (nonatomic, assign) BOOL isDYCsa;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isDYCsa = NO;
    //添加子控制器名字
    NSArray *classNames = @[@"XJFLBViewController",@"XJFSYViewController",@"XJFFXViewController",
                            @"XJFXXViewController",@"XJFSZViewController"];
    //遍历得到子控制器的类名 并添加到导航控制器中
    for (NSString *className in classNames) {
        
        UIViewController *vc = (UIViewController *)[[NSClassFromString(className) alloc] init];
        ZDYNavigationController *nc = [[ZDYNavigationController alloc] initWithRootViewController:vc];
        //图层的阴影的颜色。 动画。
        nc.view.layer.shadowColor = [UIColor blackColor].CGColor;
        //图层的阴影的偏移量。 动画。
        nc.view.layer.shadowOffset = CGSizeMake(-3.5, 0);
        //图层的阴影的不透明度。 动画。
        nc.view.layer.shadowOpacity = 0.2;
        //将指定的视图控制器添加为当前视图控制器的子级。
        [self addChildViewController:nc];
    }
    
    //添加左边显示的主菜单
    LeftMainView *view = [[LeftMainView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    //在指定的索引处插入子视图。
    [self.view insertSubview:view atIndex:1];
    view.delegate = self;
    self.LeftMainView = view;
    
    //创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    //设置代理
    pan.delegate = self;
    //添加手势
    [self.view addGestureRecognizer:pan];
}

//手势实现
- (void)pan:(UIPanGestureRecognizer *)pan{
    //平移手势在指定视图的坐标系中的平移。
    CGFloat moveX = [pan translationInView:self.view].x;
    
    //缩放的最终比例值
    CGFloat zoomScale = (SCREEN_H - ZDYScaleTopMargin * 2) / SCREEN_H;
    
    //X最终偏移距离
    CGFloat maxMoveX = SCREEN_W - SCREEN_W * ZDYZoomScaleRight;
    
    //没有缩放时，允许缩放
    if (self.showViewController.isScale == NO) {
        
        if (moveX <= maxMoveX + 5 && moveX >= 0) {
            
            //获取X偏移XY缩放的比例
            CGFloat scaleXY = 1 - moveX / maxMoveX * ZDYZoomScaleRight;
            
            CGAffineTransform transform = CGAffineTransformMakeScale(scaleXY, scaleXY);
            
            self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(transform, moveX / scaleXY, 0);
        }
        
        //当手势停止的时候,判断X轴的移动距离，停靠
        if (pan.state == UIGestureRecognizerStateEnded) {
            //计算剩余停靠时间
            if (moveX >= maxMoveX / 2) {
                CGFloat duration = 0.5 * (maxMoveX - moveX)/maxMoveX > 0 ? 0.5 * (maxMoveX - moveX)/maxMoveX : -(0.5 * (maxMoveX - moveX)/maxMoveX);
                if (duration <= 0.1) duration = 0.1;
                //直接停靠到停止的位置
                [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    CGAffineTransform tt = CGAffineTransformMakeScale(zoomScale, zoomScale);
                    self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(tt, maxMoveX , 0);
                    
                } completion:^(BOOL finished) {
                    //将状态改为已经缩放
                    self.showViewController.isScale = YES;
                    //手动点击按钮添加遮盖
                    [self.showViewController rightClick];
                }];
                
            } else  {//X轴移动不够一半 回到原位,不是缩放状态
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    self.showViewController.navigationController.view.transform = CGAffineTransformIdentity;
                    
                } completion:^(BOOL finished) {
                    self.showViewController.isScale = NO;
                }];
            }
        }
    }
    else if (self.showViewController.isScale == YES) {
        //已经缩放的情况下
        
        //计算比例
        CGFloat scaleXY = zoomScale - moveX / maxMoveX * ZDYZoomScaleRight;
        
        if (moveX <= 5) {
            
            CGAffineTransform transform = CGAffineTransformMakeScale(scaleXY, scaleXY);
            
            self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(transform, (moveX + maxMoveX), 0);
        }
        //当手势停止的时候,判断X轴的移动距离，停靠
        if (pan.state == UIGestureRecognizerStateEnded) {
            //计算剩余停靠时间
            if (-moveX >= maxMoveX / 2) {
                CGFloat duration = 0.5 * (maxMoveX + moveX)/maxMoveX > 0 ? 0.5 * (maxMoveX + moveX)/maxMoveX : -(0.5 * (maxMoveX + moveX)/maxMoveX);
                if (duration <= 0.1) duration = 0.1;
                //直接停靠到停止的位置
                [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    
                    self.showViewController.navigationController.view.transform = CGAffineTransformIdentity;
                    
                } completion:^(BOOL finished) {
                    //将状态改为已经缩放
                    self.showViewController.isScale = NO;
                    //手动点击按钮添加遮盖
                    [self.showViewController coverClick];
                }];
                
            } else {//X轴移动不够一半 回到原位,不是缩放状态
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    CGAffineTransform tt = CGAffineTransformMakeScale(zoomScale, zoomScale);
                    self.showViewController.navigationController.view.transform = CGAffineTransformTranslate(tt, maxMoveX, 0);
                    
                } completion:^(BOOL finished) {
                    self.showViewController.isScale = YES;
                }];
            }
        }
    }
}

#pragma mark - WNXLeftMenuViewDelegate 左视图按钮点击事件
- (void)leftMenuViewButtonClcikFrom:(ZDYleftButtonType)fromIndex to:(ZDYleftButtonType)toIndex{
    
    //暂时先做没有登陆的情况的点击
    ZDYNavigationController *newNC = self.childViewControllers[toIndex];
    
    //移除旧的控制器view
    ZDYNavigationController *oldNC = self.childViewControllers[fromIndex];
    [oldNC.view removeFromSuperview];

    //添加新的控制器view
    [self.view addSubview:newNC.view];
    newNC.view.transform = oldNC.view.transform;
    
    self.showViewController = newNC.childViewControllers[0];
    
    if (self.isDYCsa) {
        //自动点击遮盖btn
        [self.showViewController coverClick];
    }else{
        [self.showViewController rightClick];
        self.isDYCsa = YES;
    }
    
    
    self.showViewController.title = [ZDYDateStorageDanli initialization].controllerViewTitle;
    
    switch (toIndex) {
        case ZDYleftButtonTypeCell:
            [self xiugaiTitle];
            break;
            
        case ZDYleftButtonTypeHome:
            [self xiugaiTitle];
            break;
            
        case ZDYleftButtonTypeFound:
            [self xiugaiTitle];
            break;
            
        case ZDYleftButtonTypeMessage:
            [self xiugaiTitle];
            break;
            
        case ZDYleftButtonTypeSeting:
            [self xiugaiTitle];
            break;
            
        default:
            break;
    }
}

- (void)xiugaiTitle{
    
}

@end
