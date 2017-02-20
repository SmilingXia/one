//
//  ZDYMainLeftCell.m
//  ManView
//
//  Created by xia on 2017/1/5.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYMainLeftCell.h"
#import "ZDYimageType.h"
#import "XJFCommonmacro.h"

@interface ZDYMainLeftCell(){
    float leftBianju;
    float imageHeigth;
    float imageWidth;
}

@property (nonatomic, strong) UILabel *centerLab;
@property (nonatomic, strong) UIImageView *leftImageview;

//@property (nonatomic, strong) UIImage *leftSelectImg;
//@property (nonatomic, strong) UIImage *leftUnselectedImg;

@property (nonatomic, strong) UIImageView *rigthImageview;

@end

@implementation ZDYMainLeftCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //设置cell点击后没有背景的变化
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadsubview];
    }
    return self;
}

- (void)loadsubview{
    leftBianju = 10.0f;
    imageHeigth = 40.0f;
    imageWidth = 40.0f;
    self.leftImageview = [[UIImageView alloc] init];
    [self.contentView addSubview:self.leftImageview];
    self.leftImageview.hidden = YES;
    self.leftImageview.backgroundColor = [UIColor darkGrayColor];
    
    self.centerLab = [[UILabel alloc] init];
    [self.contentView addSubview:self.centerLab];
    self.centerLab.textColor = [UIColor darkGrayColor];
    
    self.rigthImageview = [[UIImageView alloc]  init];
    [self.contentView addSubview:self.rigthImageview];
    self.rigthImageview.hidden = YES;
    self.rigthImageview.backgroundColor = [UIColor darkGrayColor];
}

- (void)setWithCellHeigth:(float)cellHeigth andCellWidth:(float)cellWidth{
    
    self.leftImageview.frame = CGRectMake(leftBianju, (cellHeigth - imageHeigth)/2, imageHeigth, imageHeigth);
    //圆角
    self.leftImageview.layer.mask = [ZDYimageType quanYuanjiao:self.leftImageview.bounds];
    
    self.centerLab.frame = CGRectMake(CGRectGetMaxX(self.leftImageview.frame) + leftBianju, (cellHeigth - imageHeigth)/2, cellWidth - (CGRectGetMaxX(self.leftImageview.frame) + leftBianju)*2, imageHeigth);
    self.centerLab.textAlignment = NSTextAlignmentLeft;
    
    self.rigthImageview.frame = CGRectMake(CGRectGetMaxX(self.centerLab.frame) + leftBianju, (cellHeigth - imageHeigth)/2, imageWidth, imageHeigth);
   
}

- (void)isDisplayedLeftImage:(BOOL)yesAndnoLeft andIsDisplayedRightImage:(BOOL)yesAndnoRight{
    if (yesAndnoLeft) {
        self.leftImageview.hidden = !yesAndnoLeft;
    }
    if (yesAndnoRight) {
        self.rigthImageview.hidden = !yesAndnoLeft;
    }
}

-(void)setCellCenterText:(NSString *)cellCenterText{
    self.centerLab.text = cellCenterText;
}

//- (void)setCellLeftImage:(UIImage *)cellLeftImage{
//    self.leftImageview.image = cellLeftImage;
//}

//重写父类中的选中set
- (void)setSelectedimage:(BOOL)selectedimage{
    if (selectedimage) {
        _leftImageview.image = [self createImageWithColor:ZDYColor(0, 208, 187, 1)];
        self.centerLab.textColor = ZDYColor(0, 208, 187, 1);
    }else{
        _leftImageview.image = [self createImageWithColor:[UIColor darkGrayColor]];
        self.centerLab.textColor = [UIColor darkGrayColor];
    }
}

#pragma mark - 把背景颜色转化成图片
- (UIImage*)createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
