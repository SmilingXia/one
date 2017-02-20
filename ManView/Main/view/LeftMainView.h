//
//  LeftMainView.h
//  ManView
//
//  Created by xia on 2017/1/4.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <UIKit/UIKit.h>

//LeftView按钮类型
typedef NS_ENUM(NSInteger, ZDYleftButtonType) {
    ZDYleftButtonTypeCell = 0,
    ZDYleftButtonTypeHome,
    ZDYleftButtonTypeFound,
    ZDYleftButtonTypeMessage,
    ZDYleftButtonTypeSeting
};

@protocol ZDYLeftMenuViewDelegate <NSObject>

@optional

//左边按钮被点击时调用
- (void)leftMenuViewButtonClcikFrom:(ZDYleftButtonType)fromIndex to:(ZDYleftButtonType)toIndex;

//cictyBtn城市改变时调用
//- (void)leftMenuViewCictyButtonChange:(NSString *)cicty;

@end

@interface LeftMainView : UIView

@property (nonatomic, weak) id <ZDYLeftMenuViewDelegate> delegate;

@end
