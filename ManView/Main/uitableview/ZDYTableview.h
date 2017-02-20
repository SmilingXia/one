//
//  ZDYTableview.h
//  ManView
//
//  Created by xia on 2017/1/5.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectCellRbut)(UIButton *,NSIndexPath *);//回调选中cell

typedef void(^Menlei)(NSMutableArray *);

@interface ZDYTableview : UITableView

@property (nonatomic, copy) SelectCellRbut selectcellrbut;

@property (nonatomic, copy) Menlei couresMenlei;

- (void)clearCellButbackground:(BOOL)yesOrnot andTableView:(ZDYTableview *)tableview;//是否清空cell的背景


@end
