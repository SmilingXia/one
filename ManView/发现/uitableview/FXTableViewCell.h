//
//  FXTableViewCell.h
//  ManView
//
//  Created by xia on 2017/3/2.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJFCommonmacro.h"
#import "FXDataSourceModel.h"
#import "FXTableViewCellFrame.h"

@interface FXTableViewCell : UITableViewCell

@property (nonatomic, strong) FXTableViewCellFrame *fxTableViewCellFrame;

- (void)notShowRightImageView:(BOOL)show;


@end
