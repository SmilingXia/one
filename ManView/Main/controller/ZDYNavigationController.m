//
//  ZDYNavigationController.m
//  ManView
//
//  Created by xia on 2017/1/6.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYNavigationController.h"

@interface ZDYNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation ZDYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //清空interactivePopGestureRecognizer的delegate可以恢复因替换导航条的back按钮失去系统默认手势
    self.interactivePopGestureRecognizer.delegate = nil;
    
    //禁止手势冲突
    self.interactivePopGestureRecognizer.enabled = NO;
    
    //在runtime中查到的系统tagert 和方法名 手动添加手势，调用系统的方法,这个警告看着不爽，我直接强制去掉了~
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
#pragma clang diagnostic pop
    
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
}

//在接受第一条消息前初始化
+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    //给导航栏设置背景颜色以 -- forBarMetrics条形度量常数 -- UIBarMetricsDefault默认的尺度
    [bar setBackgroundImage:[UIImage imageNamed:@"recomend_btn_gone"] forBarMetrics:UIBarMetricsDefault];
    //去掉导航条的半透明
    bar.translucent = NO;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [bar setTitleTextAttributes:dict];
}

#pragma mark - 手势代理方法
// 是否开始触发手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 判断下当前控制器是否是跟控制器
    return (self.topViewController != [self.viewControllers firstObject]);
}

@end
