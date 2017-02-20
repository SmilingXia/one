//
//  ZDYTableview.m
//  ManView
//
//  Created by xia on 2017/1/5.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "ZDYTableview.h"
#import "XJFCommonmacro.h"
#import "ZDYMainLeftCell.h"
#import "LeftMainView.h"
#import "ZDYDateStorageDanli.h"
#import "LXNetworking.h"
#import "ZDYCourseCategoriesVO.h"
#import "MBProgressHUD.h"

@interface ZDYTableview()<UITableViewDelegate,UITableViewDataSource>

//@property (nonatomic, strong) ZDYMainLeftCell *cell;

@property (nonatomic, strong) UIButton *cellBut;

//网络请求类
@property (nonatomic, strong) LXURLSessionTask *task;

@property (nonatomic, strong) NSMutableArray *courseCategoriesArray;//门类集合

@property (nonatomic,strong) NSIndexPath *lastIndexPath;
@property (nonatomic,assign) NSInteger lastIndexPathRow;
@property (nonatomic,assign) NSInteger lastIndexPathSection;

@end

@implementation ZDYTableview

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self getDataScouresInfo];
        self.lastIndexPathRow = 0;
        self.lastIndexPathSection = 0;
        self.backgroundColor = [UIColor clearColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.delegate = self;
        self.dataSource = self;
        self.cellBut = [[UIButton alloc] init];
        self.cellBut.tag = ZDYleftButtonTypeCell;
        
    }
    return self;
}


#pragma mark - 获取数据信息
- (void)getDataScouresInfo{
    //获取考试门类
    _task = [LXNetworking postWithUrl:KSML_URL params:nil success:^(NSDictionary *dict) {

        ZDYMenLeiVO *mlvo = [[ZDYMenLeiVO alloc] initWithDictionary:dict error:nil];
        if ([mlvo.errcode isEqualToString:@"0"]) {
            NSMutableArray *muArray = [NSMutableArray array];
            for (ZDYCourseCategoriesVO *ccvo in mlvo.bigclass) {
                [muArray addObject:ccvo];
            }
            self.courseCategoriesArray = muArray;
            self.couresMenlei(self.courseCategoriesArray);
            NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            _selectcellrbut(self.cellBut,selectedIndexPath);
        }
    } fail:^(NSError *error) {
        
    } showHUD:YES];
}


#pragma mark - UITableview的方法代理实现

- (CGFloat)rowHeight{
    return 55.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.courseCategoriesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ZDYMainLeftCellIdentifier = @"ZDYMainLeftCellIdentifier";
    ZDYMainLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:ZDYMainLeftCellIdentifier];
    if (cell == nil) {
        cell = [[ZDYMainLeftCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ZDYMainLeftCellIdentifier];
        [cell isDisplayedLeftImage:YES andIsDisplayedRightImage:NO];
        [cell setWithCellHeigth:70.0f andCellWidth:self.frame.size.width];
    }
    ZDYCourseCategoriesVO *ccvo = [self.courseCategoriesArray objectAtIndex:indexPath.row];
    cell.cellCenterText = ccvo.title;
    if ( indexPath.row == self.lastIndexPathRow && indexPath.section == self.lastIndexPathSection) {
        cell.selectedimage = YES;
        self.lastIndexPath = indexPath;
    }else{
        cell.selectedimage = NO;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消选择的cell背景
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //回调到leftMainView实现点击cell
    _selectcellrbut(self.cellBut,indexPath);

    ZDYMainLeftCell *cell = [tableView cellForRowAtIndexPath:self.lastIndexPath];
    cell.selectedimage = NO;

    ZDYMainLeftCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
    newCell.selectedimage = YES;
    
    //记住当前选中的cell
    self.lastIndexPath = indexPath;
    self.lastIndexPathRow = indexPath.row;
    self.lastIndexPathSection = indexPath.section;
    //执行控制器的切换 以及请求数据
}
#pragma mark - 是否清空cell的背景
- (void)clearCellButbackground:(BOOL)yesOrnot andTableView:(ZDYTableview *)tableview{
    if (yesOrnot) {
        ZDYMainLeftCell *cell = [tableview cellForRowAtIndexPath:self.lastIndexPath];
        cell.selectedimage = NO;
    }
}

@end
