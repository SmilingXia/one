//
//  ZDYCheckcourseVO.h
//  ManView
//
//  Created by xia on 2017/1/24.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "JSONModel.h"

@interface ZDYCheckcourseVO : JSONModel
//errcode 【提示码，0为成功，非0异常】
//errmsg 【提示消息】,
//m2 【章节练习，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m3 【章节测试，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m5 【模拟测试，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m6 【考前押题，值含义：0： 没有此模块， 1：有此模块并且已购买已开放学习  ，2：有此模块未购买 ，3：有此模块并且已购买但未到开放时间，-1：已过期】
//m7 【错题回顾，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m11【历年真题，值含义：0：没有此模块 1：有此模块并且已购买  ，2：有此模块未购买，-1：已过期】
//m12【收藏试题，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m13【笔记试题，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m14【精讲视频，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m15 【免费试用，值含义：0：没有此模块，1：可以学习】
//m16【随手练一练，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m17【考点精解，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m18【考前串讲，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m20【高频考题，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m21【高频错题，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m22【有问必答，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m23【习题视频，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m24【知识库，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m25【直播公开课，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m26【直播正式课，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m27【答案解析，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m28【试题考点视频，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m29【专题视频，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//m30【猜你会错，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
//banxing_tiku【题库班型ID】
//banxing_crosstalk【考前串讲班型ID】
//banxing_jingjiang【视频精讲班型ID】
//banxing_live【直播课程班型ID】
//banxing_xiti【习题班型ID】
//isbuy_tiku【题库班型（标准班，vip班，基础班，无忧班）购买状态，值含义：0：未购买，1：已购买，2：已过期】
//isbuy_crosstalk【考前串讲班购买状态，值含义：0：未购买，1：已购买，2：已过期】
//isbuy_jingjiang【视频精讲班购买状态，值含义：0：未购买，1：已购买，2：已过期】
//isbuy_live【直播课程购买状态，值含义：0：未购买，1：已购买，2：已过期】
//isbuy_xiti【习题班购买状态，值含义：0：未购买，1：已购买，2：已过期】
//needxieyi_tiku【题库班型（标准班，vip班，基础班，无忧班）需不需签约状态，值如果为空则不需要签约，值为班型名称时则需要签约】
//needxieyi_crosstalk【考前串讲班需不需签约状态，值如果为空则不需要签约，值为班型名称时则需要签约】
//needxieyi_jingjiang【视频精讲班需不需签约状态，值如果为空则不需要签约，值为班型名称时则需要签约】
//needxieyi_live【直播课程需不需签约状态，值如果为空则不需要签约，值为班型名称时则需要签约】
//needxieyi_xiti【习题班需不需签约状态，值如果为空则不需要签约，值为班型名称时则需要签约】
//packageid_tiku【题库班型（标准班，vip班，基础班，无忧班）套餐ID，获取保过协议时的一个参数】
//packageid_crosstalk【考前串讲班套餐ID，获取保过协议时的一个参数】
//packageid_jingjiang【视频精讲班套餐ID，获取保过协议时的一个参数】
//packageid_live【直播课程套餐ID，获取保过协议时的一个参数】
//packageid_xiti【习题班套餐ID，获取保过协议时的一个参数】
//recentexamtime【距离最近一次考试倒计时天数】
//tutorship【辅导老师二维码，不为空时可以显示出来】
//kaoqi【考期ID】
//examtime【考试日期】
//changekaoqitimes【更换考期数量，每期仅能更换1次】


/**
 * 【提示码，0为成功，非0异常】
 */
@property (nonatomic, strong) NSString *errcode;

/**
 * 【提示消息】
 */
@property (nonatomic, strong) NSString *errmsg;
/**
 * 【章节练习，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m2;
/**
 * 【章节测试，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m3;
/**
 * 【模拟测试，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m5;
/**
 * 【考前押题，值含义：0： 没有此模块， 1：有此模块并且已购买已开放学习  ，2：有此模块未购买 ，3：有此模块并且已购买但未到开放时间，-1：已过期】
 */
@property (nonatomic, strong) NSString *m6;
/**
 * 【错题回顾，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m7;
/**
 * 【历年真题，值含义：0：没有此模块 1：有此模块并且已购买  ，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m11;
/**
 * 【收藏试题，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m12;
/**
 * 【笔记试题，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m13;
/**
 * 【精讲视频，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m14;
/**
 * 【免费试用，值含义：0：没有此模块，1：可以学习】
 */
@property (nonatomic, strong) NSString *m15;
/**
 * 【随手练一练，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m16;
/**
 * 【考点精解，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m17;
/**
 * 【考前串讲，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m18;
/**
 * 【高频考题，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m20;
/**
 * 【高频错题，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m21;
/**
 * 【有问必答，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m22;
/**
 * 【习题视频，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m23;
/**
 * 【知识库，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m24;
/**
 * 【直播公开课，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m25;
/**
 * 【直播正式课，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m26;
/**
 * 【答案解析，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m27;
/**
 * 【试题考点视频，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m28;
/**
 * 【专题视频，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m29;
/**
 * 【猜你会错，值含义：0：没有此模块，1：已购买，2：有此模块未购买，-1：已过期】
 */
@property (nonatomic, strong) NSString *m30;

/**
 *
 */
@property (nonatomic, strong) NSString *m31;
/**
 *
 */
@property (nonatomic, strong) NSString *m32;
/**
 *
 */
@property (nonatomic, strong) NSString *m33;
/**
 *
 */
@property (nonatomic, strong) NSString *m34;
/**
 *
 */
@property (nonatomic, strong) NSString *m35;
/**
 *
 */
@property (nonatomic, strong) NSString *m36;
/**
 *
 */
@property (nonatomic, strong) NSString *m37;
/**
 *
 */
@property (nonatomic, strong) NSString *m38;
/**
 *
 */
@property (nonatomic, strong) NSString *m39;
/**
 *
 */
@property (nonatomic, strong) NSString *m40;


/**
 * 【题库班型ID】
 */
@property (nonatomic, strong) NSString *banxing_tiku;
/**
 * 【考前串讲班型ID】
 */
@property (nonatomic, strong) NSString *banxing_crosstalk;
/**
 * 【视频精讲班型ID】
 */
@property (nonatomic, strong) NSString *banxing_jingjiang;
/**
 * 【直播课程班型ID】
 */
@property (nonatomic, strong) NSString *banxing_live;
/**
 * 【习题班型ID】
 */
@property (nonatomic, strong) NSString *banxing_xiti;
/**
 * 【题库班型（标准班，vip班，基础班，无忧班）购买状态，值含义：0：未购买，1：已购买，2：已过期】
 */
@property (nonatomic, strong) NSString *isbuy_tiku;
/**
 * 【考前串讲班购买状态，值含义：0：未购买，1：已购买，2：已过期】
 */
@property (nonatomic, strong) NSString *isbuy_crosstalk;
/**
 * 【视频精讲班购买状态，值含义：0：未购买，1：已购买，2：已过期】
 */
@property (nonatomic, strong) NSString *isbuy_jingjiang;
/**
 * 【直播课程购买状态，值含义：0：未购买，1：已购买，2：已过期】
 */
@property (nonatomic, strong) NSString *isbuy_live;
/**
 * 【习题班购买状态，值含义：0：未购买，1：已购买，2：已过期】
 */
@property (nonatomic, strong) NSString *isbuy_xiti;
/**
 * 【题库班型（标准班，vip班，基础班，无忧班）需不需签约状态，值如果为空则不需要签约，值为班型名称时则需要签约】
 */
@property (nonatomic, strong) NSString *needxieyi_tiku;
/**
 * 【考前串讲班需不需签约状态，值如果为空则不需要签约，值为班型名称时则需要签约】
 */
@property (nonatomic, strong) NSString *needxieyi_crosstalk;
/**
 * 【视频精讲班需不需签约状态，值如果为空则不需要签约，值为班型名称时则需要签约】
 */
@property (nonatomic, strong) NSString *needxieyi_jingjiang;
/**
 * 【直播课程需不需签约状态，值如果为空则不需要签约，值为班型名称时则需要签约】
 */
@property (nonatomic, strong) NSString *needxieyi_live;
/**
 * 【习题班需不需签约状态，值如果为空则不需要签约，值为班型名称时则需要签约】
 */
@property (nonatomic, strong) NSString *needxieyi_xiti;
/**
 * 【题库班型（标准班，vip班，基础班，无忧班）套餐ID，获取保过协议时的一个参数】
 */
@property (nonatomic, strong) NSString *packageid_tiku;
/**
 * 【考前串讲班套餐ID，获取保过协议时的一个参数】
 */
@property (nonatomic, strong) NSString *packageid_crosstalk;
/**
 * 【视频精讲班套餐ID，获取保过协议时的一个参数】
 */
@property (nonatomic, strong) NSString *packageid_jingjiang;
/**
 * 【直播课程套餐ID，获取保过协议时的一个参数】
 */
@property (nonatomic, strong) NSString *packageid_live;
/**
 * 【习题班套餐ID，获取保过协议时的一个参数】
 */
@property (nonatomic, strong) NSString *packageid_xiti;
/**
 * 【距离最近一次考试倒计时天数】
 */
@property (nonatomic, strong) NSString *recentexamtime;
/**
 * 【辅导老师二维码，不为空时可以显示出来】
 */
@property (nonatomic, strong) NSString *tutorship;
/**
 * 【考期ID】
 */
@property (nonatomic, strong) NSString *kaoqi;
/**
 * 【考试日期】
 */
@property (nonatomic, strong) NSString *examtime;
/**
 * 【更换考期数量，每期仅能更换1次】
 */
//@property (nonatomic, strong) NSString *changekaoqitimes;



@end
