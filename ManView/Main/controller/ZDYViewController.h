//
//  ZDYViewController.h
//  ManView
//
//  Created by xia on 2017/1/6.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UrlNSstring.h"

typedef void (^coverDidRomove)();

@interface ZDYViewController : UIViewController

//** 遮盖按钮 */
@property (nonatomic, strong) UIButton *coverBtn;

@property (nonatomic, strong) coverDidRomove coverDidRomove;

@property (nonatomic, assign) BOOL isScale;

- (void)coverClick;

/** 点击缩放按钮 */
- (void)rightClick;

@end
