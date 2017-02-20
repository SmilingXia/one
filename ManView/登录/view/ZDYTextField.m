//
//  ZDYTextField.m
//  ManView
//
//  Created by xia on 2017/1/19.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYTextField.h"

@interface ZDYTextField()

@end

@implementation ZDYTextField

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)defaultStyle{
    self.layer.cornerRadius = 10.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = ZDYColor(255, 255, 255, 0.8).CGColor;
    self.font = ZDYTextFont(20.0f);
    self.leftViewMode = UITextFieldViewModeAlways;
    self.clearButtonMode = UITextFieldViewModeAlways;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 15; //像右边偏15
    return iconRect;
}

//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 50, 0);
    
}

//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 50, 0);
}

@end
