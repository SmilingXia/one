//
//  LBSCrollViewLB.m
//  ManView
//
//  Created by xia on 2017/1/17.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "LBSCrollViewLB.h"
#import "XJFCommonmacro.h"

@interface LBSCrollViewLB()<UIScrollViewDelegate>

/**
 * 保存可见的视图
 */

@property (nonatomic, strong) NSMutableSet *kejianImageViews;
/**
 * 保存可重用的视图
 */
@property (nonatomic, strong) NSMutableSet *chongyongImageViews;


@end

@implementation LBSCrollViewLB

- (NSMutableSet *)kejianImageViews{
    if (_kejianImageViews == nil) {
        _kejianImageViews = [[NSMutableSet alloc] init];
    }
    return _kejianImageViews;
}

- (NSMutableSet *)chongyongImageViews{
    if (_chongyongImageViews == nil) {
        _chongyongImageViews = [[NSMutableSet alloc] init];
    }
    return _chongyongImageViews;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.bounces = NO;
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor darkGrayColor];
    }
    return self;
}

/**
 *  显示一个图片view
 */
- (void)showImageViewAtIndex:(NSInteger)index {
    
    UIImageView *imageView = [self.chongyongImageViews anyObject];
    if (imageView) {
        [self.chongyongImageViews removeObject:imageView];
    } else {
        imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    CGRect bounds = self.bounds;
    CGRect imageViewFrame = bounds;
    imageViewFrame.origin.x = CGRectGetWidth(bounds) * index;
    imageView.tag = index;
    imageView.frame = imageViewFrame;
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"lb_%ld_coures@2x",(index%5)]];
    [self.kejianImageViews addObject:imageView];
    [self addSubview:imageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"执行多次");
    [self showImages];
}

#pragma mark - Private Method

- (void)showImages{
    // 获取当前处于显示范围内的图片的索引
    CGRect visibleBounds = self.bounds;
    CGFloat minX = CGRectGetMinX(visibleBounds);
    CGFloat maxX = CGRectGetMaxX(visibleBounds);
    CGFloat width = CGRectGetWidth(visibleBounds);
    
    NSInteger firstIndex = (NSInteger)floorf(minX / width);
    NSInteger lastIndex  = (NSInteger)floorf(maxX / width);
    // 处理越界的情况
    if (firstIndex < 0) {
        firstIndex = 0;
    }
    if (lastIndex >= self.XJFCourseCategoriesVO.smallclass.count) {
        lastIndex = self.XJFCourseCategoriesVO.smallclass.count - 1;
    }
    // 回收不再显示的ImageView
    NSInteger imageViewIndex = 0;
    for (UIImageView *imageView in self.kejianImageViews) {
        imageViewIndex = imageView.tag;
        // 不在显示范围内
        if (imageViewIndex < firstIndex || imageViewIndex > lastIndex) {
            [self.chongyongImageViews addObject:imageView];
            [imageView removeFromSuperview];
        }
    }
    [self.kejianImageViews minusSet:self.chongyongImageViews];
    // 是否需要显示新的视图
    for (NSInteger index = firstIndex; index <= lastIndex; index++) {
        BOOL isShow = NO;
        
        for (UIImageView *imageView in self.kejianImageViews) {
            if (imageView.tag == index) {
                isShow = YES;
            }
        }
        if (!isShow) {
            [self showImageViewAtIndex:index];
        }
    }
}

//无数据视图
- (void)loadSubviewWu{
    CGRect wuShujuRect = self.bounds;
    UILabel *wuShujuLab = [[UILabel alloc] initWithFrame:CGRectMake(0, (wuShujuRect.size.height - 30)/2, SCREEN_W, 30)];
    [self addSubview:wuShujuLab];
    wuShujuLab.font = [UIFont systemFontOfSize:18.0f];
    wuShujuLab.text = @"该类还未添加课程";
    wuShujuLab.textAlignment = NSTextAlignmentCenter;
    wuShujuLab.textColor = [UIColor grayColor];
    self.contentSize = CGSizeMake(SCREEN_W, wuShujuRect.size.height);
}

- (void)setXJFCourseCategoriesVO:(ZDYCourseCategoriesVO *)XJFCourseCategoriesVO{
    _XJFCourseCategoriesVO = XJFCourseCategoriesVO;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.contentSize = CGSizeMake(SCREEN_W*XJFCourseCategoriesVO.smallclass.count, SCREEN_H/3);
    if (XJFCourseCategoriesVO.smallclass.count<1) {
        [self loadSubviewWu];
    }else{
        [self showImageViewAtIndex:0];
    }
}

@end
