//
//  LeftMainView.m
//  ManView
//
//  Created by xia on 2017/1/4.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "LeftMainView.h"
#import "XJFCommonmacro.h"
#import "ZDYTableView.h"
#import "ZDYDateStorageDanli.h"
#import "ZDYCourseCategoriesVO.h"
#import "ZDYNotificationCenter.h"

@interface LeftMainView ()

@property (nonatomic, strong) UILabel *titleLab;//显示的名称

@property (nonatomic, strong) ZDYTableview *xinxiListTableview;//具体信息的列表

@property (nonatomic, strong) UIButton *cellBut;//cell选中的按钮

@property (nonatomic, strong) UIButton *shouyeBut;//首页
@property (nonatomic, strong) UIButton *faxianBut;//发现
@property (nonatomic, strong) UIButton *xiaoxiBut;//消息
@property (nonatomic, strong) UIButton *shezhiBut;//设置
@property (nonatomic, strong) UIButton *starButton;//全局固定点击

@property (nonatomic, strong) UIView *titleLabView;//标题下的横线
@property (nonatomic, strong) UIView *tableviewListView;//列表下的横线

@property (nonatomic, assign) int indexPathRow;
@property (nonatomic, strong) NSArray *butTitleTextArray;
@property (nonatomic, strong) NSArray *menleiArray;

@end

@implementation LeftMainView

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:41.0f/255 green:42.0f/255 blue:43.0f/255 alpha:1.0];
        
        self.butTitleTextArray = @[@"首页",@"发现",@"消息",@"设置"];
        
        //显示的信息名称
        UILabel *titleLab = [[UILabel alloc] init];
        [self addSubview:titleLab];
        self.titleLab = titleLab;
        
        //划线
        UIView *titleLabView = [[UIView alloc] init];
        [self addSubview:titleLabView];
        self.titleLabView = titleLabView;
        
        //划线
        UIView *tableviewListView = [[UIView alloc] init];
        [self addSubview:tableviewListView];
        self.tableviewListView = tableviewListView;
        
        //添加几个按钮
        UIButton *shouyeBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:shouyeBut];
        self.shouyeBut = shouyeBut;
        
        UIButton *faxianBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:faxianBut];
        self.faxianBut = faxianBut;
        
        UIButton *xiaoxiBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:xiaoxiBut];
        self.xiaoxiBut = xiaoxiBut;
        
        UIButton *shezhiBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:shezhiBut];
        self.shezhiBut = shezhiBut;
        
        [self loadSubview];
    }
    return self;
}

- (void)loadSubview{
    //除按钮之外的控件
    float gudingzhiLeft = 0.0f;
    float gudingzhiTop = 20.0f;
    float viewWidth = SCREEN_W*0.6;
    
    //按钮的参数
    float gudingzhiBut = 5.0f;
    float butHeight = 55.0f;
    float whbili = butHeight/109.0f;
    float butWidth = 168.0f*whbili;
    float butLeftX = (viewWidth - butWidth)/3;
    
    //标题
    self.titleLab.frame = CGRectMake(gudingzhiLeft, gudingzhiTop, viewWidth, 40);
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.text = [ZDYDateStorageDanli initialization].loginUserInfo.nickname;
    self.titleLab.textColor = [UIColor whiteColor];
    
    self.titleLabView.frame = CGRectMake(0, CGRectGetMaxY(self.titleLab.frame), viewWidth, 0.5);
    self.titleLabView.backgroundColor = [UIColor darkGrayColor];

    //Tableview列表 - 显示的列表信息
    self.xinxiListTableview = [[ZDYTableview alloc] initWithFrame:CGRectMake(gudingzhiLeft, CGRectGetMaxY(self.titleLab.frame) + 1, viewWidth, SCREEN_H - CGRectGetMaxY(self.titleLab.frame) - 261) style:UITableViewStyleGrouped];
    [self addSubview:self.xinxiListTableview];
    
    //这里回调cell中的按钮
    WEAK_SELF;
    self.xinxiListTableview.selectcellrbut = ^(UIButton *cellbut,NSIndexPath *indexPath){
        STRONG_SELF;
        strongSelf.indexPathRow = (int)indexPath.row;
        [strongSelf butOnclick:cellbut];
    };
    self.xinxiListTableview.couresMenlei = ^(NSMutableArray *array){
        STRONG_SELF;
        strongSelf.menleiArray = array;
        [strongSelf.xinxiListTableview reloadData];
    };
    
    //横线
    self.tableviewListView.frame = CGRectMake(0, CGRectGetMaxY(self.xinxiListTableview.frame), viewWidth, 0.5);
    self.tableviewListView.backgroundColor = [UIColor darkGrayColor];
    
    
    //按钮
    self.shouyeBut.frame = CGRectMake(butLeftX,CGRectGetMaxY(self.xinxiListTableview.frame)+gudingzhiBut, butWidth, butHeight);
    self.faxianBut.frame = CGRectMake(butLeftX, CGRectGetMaxY(self.shouyeBut.frame) + gudingzhiBut, butWidth, butHeight);
    self.xiaoxiBut.frame = CGRectMake(butLeftX, CGRectGetMaxY(self.faxianBut.frame) + gudingzhiBut, butWidth, butHeight);
    self.shezhiBut.frame = CGRectMake(butLeftX, CGRectGetMaxY(self.xiaoxiBut.frame) + gudingzhiBut, butWidth, butHeight);
    self.shouyeBut.tag = ZDYleftButtonTypeHome;
    self.faxianBut.tag = ZDYleftButtonTypeFound;
    self.xiaoxiBut.tag = ZDYleftButtonTypeMessage;
    self.shezhiBut.tag = ZDYleftButtonTypeSeting;
    [self setButtonObject:self.shouyeBut andNormalImage:[UIImage imageNamed:@"home@2x"] andSelectedImage:[UIImage imageNamed:@"homeSeletced@2x"]];
    [self setButtonObject:self.faxianBut andNormalImage:[UIImage imageNamed:@"found@2x"]andSelectedImage:[UIImage imageNamed:@"foundSelected@2x"]];
    [self setButtonObject:self.xiaoxiBut andNormalImage:[UIImage imageNamed:@"message@2x"]andSelectedImage:[UIImage imageNamed:@"messageSelected@2x"]];
    [self setButtonObject:self.shezhiBut andNormalImage:[UIImage imageNamed:@"seting@2x"]andSelectedImage:[UIImage imageNamed:@"setingSelected@2x"]];
}

//这里写一个按钮的公共方法 -- 设置按钮的背景 - title - 图片 - 事件
- (void)setButtonObject:(UIButton *)senderBut andNormalImage:(UIImage *)normalimage andSelectedImage:(UIImage *)selectedImage{
    
    //设置button正常状态下的图片
    [senderBut setImage:normalimage forState:UIControlStateNormal];
    //设置button选择状态下的图片
    [senderBut setImage:selectedImage forState:UIControlStateSelected];

    [senderBut addTarget:self action:@selector(butOnclick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setDelegate:(id<ZDYLeftMenuViewDelegate>)delegate
{
    _delegate = delegate;
}

- (void)butOnclick:(id)sender{
    UIButton *senderBut = (UIButton *)sender;
    if (senderBut.tag == ZDYleftButtonTypeCell) {
        ZDYCourseCategoriesVO *ccvo = [self.menleiArray objectAtIndex:_indexPathRow];
        [ZDYDateStorageDanli initialization].XZCourse = ccvo;
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                              ccvo, @"ZDYCourseCategoriesVO",
                              nil];
        [ZDYNotificationCenter updateCourse:dictionary];//更新课程通知
    }else{
        [ZDYDateStorageDanli initialization].controllerViewTitle = [self.butTitleTextArray objectAtIndex:senderBut.tag - 1];
    }
    if ([self.delegate respondsToSelector:@selector(leftMenuViewButtonClcikFrom:to:)]) {
        [self.delegate leftMenuViewButtonClcikFrom:(ZDYleftButtonType)self.starButton.tag to:(ZDYleftButtonType)senderBut.tag];
    }
    if (senderBut.tag == ZDYleftButtonTypeCell) {
        self.starButton.selected=NO;
    }else{
        if(senderBut != self.starButton){
            self.starButton.selected=NO;
            self.starButton = senderBut;
        }
        //经典的按钮选择与未选择状态的切换
        //self.shouyeBut.selected = !self.shouyeBut.selected;
        self.starButton.selected=YES;
        
        //清楚cell的选中状态背景
        [self.xinxiListTableview clearCellButbackground:YES andTableView:self.xinxiListTableview];
    }
}


@end
