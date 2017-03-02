//
//  FXTableView.m
//  ManView
//
//  Created by xia on 2017/3/2.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "FXTableView.h"
#import "FXTableViewCell.h"
#import "FXTableViewCellFrame.h"

@interface FXTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FXTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setDataSource:self];
        [self setDelegate:self];
    }
    return self;
}


- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return _dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *FXCellIdentifier = @"FXCellIdentifier";
    FXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FXCellIdentifier];
    if (cell == nil) {
        cell = [[FXTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:FXCellIdentifier];
        [cell notShowRightImageView:YES];
    }
    FXTableViewCellFrame *cellFrame = [[FXTableViewCellFrame alloc] init];
    cellFrame.fxDataSourceModel = [_dataSourceArray objectAtIndex:indexPath.row];
    cell.fxTableViewCellFrame = cellFrame;
    return cell;
}


#pragma mark - tableview的代理 设置cell的高度 (这里用模型来设置，以便动态)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FXDataSourceModel *fxDataSourceModel = [_dataSourceArray objectAtIndex:indexPath.row];
    FXTableViewCellFrame *cellFrame = [[FXTableViewCellFrame alloc] init];
    cellFrame.fxDataSourceModel = fxDataSourceModel;
    return cellFrame.cellHeight;
}


- (void)setDataSourceArray:(NSArray *)dataSourceArray{
    _dataSourceArray = dataSourceArray;
    [self reloadData];
}

@end
