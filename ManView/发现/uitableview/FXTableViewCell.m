//
//  FXTableViewCell.m
//  ManView
//
//  Created by xia on 2017/3/2.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "FXTableViewCell.h"
#import "UrlNSstring.h"
#import "UIImageView+AFNetworking.h"

@interface FXTableViewCell()

@property (nonatomic, strong) UIImageView   *avatarView;//头像
@property (nonatomic, strong) UILabel       *labelName;//名字
@property (nonatomic, strong) UILabel       *labelData;//日期
@property (nonatomic, strong) UILabel       *labelConten;//内容
@property (nonatomic, strong) UIView        *dividingLine;//分割线
@property (nonatomic, strong) UIImageView   *rightImageView;//右边cell图标


@end

@implementation FXTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //设置cell点击后没有背景的变化
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadSubview];
    }
    return self;
}

- (void)loadSubview{
    self.avatarView = [[UIImageView alloc] init];
    [self addSubview:self.avatarView];
    self.avatarView.backgroundColor = [UIColor redColor];
    CALayer *imagelayer = [self.avatarView layer];
    [imagelayer setMasksToBounds:YES];
    [imagelayer setCornerRadius:25.0];
    
    self.labelName = [[UILabel alloc] init];
    [self addSubview:self.labelName];
    self.labelName.textColor = [UIColor redColor];
    self.labelName.textAlignment = NSTextAlignmentLeft;
    
    self.labelData = [[UILabel alloc] init];
    [self addSubview:self.labelData];
    self.labelData.textAlignment = NSTextAlignmentLeft;
    
    self.labelConten = [[UILabel alloc] init];
    [self addSubview:self.labelConten];
    self.labelConten.numberOfLines = 0;
    
    self.dividingLine = [[UIView alloc] init];
    [self addSubview:self.dividingLine];
    self.dividingLine.backgroundColor = [UIColor darkGrayColor];
    
    self.rightImageView = [[UIImageView alloc] init];
    [self addSubview:self.rightImageView];
    self.rightImageView.hidden = YES;
}

- (void)notShowRightImageView:(BOOL)show{
    if (show) {
        self.rightImageView.hidden = YES;
    }else{
        self.rightImageView.hidden = NO;
    }
}

- (void)setFxTableViewCellFrame:(FXTableViewCellFrame *)fxTableViewCellFrame{
    _fxTableViewCellFrame = fxTableViewCellFrame;
    //设置数据源
    [self settingDataInfo];
    //设置控件的Frame
    [self setSubViewsFrame];
}


#pragma mark - 设置数据
- (void)settingDataInfo{
    FXDataSourceModel *cellInfoMode = _fxTableViewCellFrame.fxDataSourceModel;
    //引用UIImageView+AFNetworking.h文件对图片做缓存
    [self.avatarView setImageWithURL:cellInfoMode.imageUrl];
    self.labelName.text = cellInfoMode.userName;
    self.labelData.text = cellInfoMode.date;
    self.labelConten.text = cellInfoMode.text;
}

#pragma mark - 设置控件的frame
- (void)setSubViewsFrame{
    self.avatarView.frame = _fxTableViewCellFrame.avatarViewFrame;
    self.labelName.frame = _fxTableViewCellFrame.labelNameFrame;
    self.labelData.frame = _fxTableViewCellFrame.labelDataFrame;
    self.labelConten.frame = _fxTableViewCellFrame.labelContenFrame;
    self.dividingLine.frame = _fxTableViewCellFrame.dividingLineFrame;
    self.rightImageView.frame = _fxTableViewCellFrame.rightImageViewFrame;
}


- (UIImage *)imageFromURLString:(NSURL *)urlstring{
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:urlstring]];
}


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
