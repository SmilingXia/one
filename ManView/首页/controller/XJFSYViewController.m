//
//  XJFSYViewController.m
//  ManView
//
//  Created by xia on 2017/1/6.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "XJFSYViewController.h"
#import "XJFCommonmacro.h"

@interface XJFSYViewController ()

@end

@implementation XJFSYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UILabel *lib = [[UILabel alloc] init];
    [self.view addSubview:lib];
    lib.frame = CGRectMake(0, (CONTENT_H  - 40)/2, SCREEN_W, 40);
    lib.text = @"二";
    lib.font = [UIFont systemFontOfSize:20.0f];
    lib.textAlignment = NSTextAlignmentCenter;
    lib.textColor = [UIColor whiteColor];
}




@end
