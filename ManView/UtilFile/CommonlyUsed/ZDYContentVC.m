//
//  ZDYContentVC.m
//  ManView
//
//  Created by xia on 2017/1/20.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYContentVC.h"
#import "XJFCommonmacro.h"
#import "UIBarButtonItem+ZDYBarButtonItem.h"

@interface ZDYContentVC ()

@end

@implementation ZDYContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ZDYColor(239, 239, 244, 1);
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithNormalImage:@"content_bar_return" target:self action:@selector(leftBarClick) width:30 height:30];
}

- (void)leftBarClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setRightShow:(BOOL)rightShow{
    if (rightShow) {
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithNormalImage:@"courseinfo_gengduo" target:self action:@selector(rightBarClick) width:30 height:30];
    }
}

- (void)rightBarClick{
    
}

@end
