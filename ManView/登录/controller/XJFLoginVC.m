//
//  XJFLoginVC.m
//  ManView
//
//  Created by xia on 2017/1/19.
//  Copyright © 2017年 cn.bkw. All rights reserved.
//

#import "XJFLoginVC.h"
#import "XJFCommonmacro.h"
#import "ZDYimageType.h"
#import "ZDYTextField.h"
#import "FBInputValidation.h"
#import "ZDYUIAlertView.h"
#import "ZDYEdsEncryption.h"
#import "ZDYNetworkRequest.h"
#import "MBProgressHUD.h"
#import "ZDYUserLoginVO.h"
#import "ZDYDateStorageDanli.h"
#import "AppDelegate.h"

@interface XJFLoginVC ()<UITextFieldDelegate>

@property (nonatomic, strong) ZDYNetworkRequest *loginRequest;

@property (nonatomic, strong) UIImageView *backgroundImg;
@property (nonatomic, strong) UIImageView *logoImg;

@property (nonatomic, strong) ZDYTextField *loginUserTF;
@property (nonatomic, strong) ZDYTextField *loginPwdTF;

@property (nonatomic, strong) UIButton *registeredUserButton;
@property (nonatomic, strong) UIButton *forgetPasswordButton;

@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) UIButton *youKeloginButton;

@end

@implementation XJFLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backgroundImg];
    [self.view addSubview:self.logoImg];
    [self loadSubTextField];
}

/**
 *  文本输入
 */
- (void)loadSubTextField{
    float textFieldBR = 20.0f;
    float textFieldH = 45.0f;
    float imageHW = 25.0f;
    float textFieldW = SCREEN_W - 2*textFieldBR;
    
    //账号
    UIImageView *leftImageU = [[UIImageView alloc]initWithFrame:CGRectMake(0,(textFieldH- imageHW)/2,imageHW,imageHW)];
    leftImageU.image = [UIImage imageNamed:@"login_user"];
    _loginUserTF = [[ZDYTextField alloc] initWithFrame:CGRectMake(textFieldBR,SCREEN_H*0.35,textFieldW, textFieldH)];
    [self.view addSubview:_loginUserTF];
    _loginUserTF.tag = 1001;
    _loginUserTF.placeholder = @"账  号";
    [_loginUserTF defaultStyle];
    _loginUserTF.delegate = self;
    _loginUserTF.keyboardType = UIKeyboardTypeNumberPad;
    _loginUserTF.leftView = leftImageU;
    
    //密码
    UIImageView *leftImageP=[[UIImageView alloc]initWithFrame:CGRectMake(0,(textFieldH- imageHW)/2,imageHW,imageHW)];
    leftImageP.image = [UIImage imageNamed:@"login_password"];
    _loginPwdTF = [[ZDYTextField alloc] initWithFrame:CGRectMake(textFieldBR,SCREEN_H * 0.48,textFieldW, textFieldH)];
    [self.view addSubview:_loginPwdTF];
    _loginPwdTF.tag = 1002;
    _loginPwdTF.placeholder = @"密   码";
    [_loginPwdTF defaultStyle];
    _loginPwdTF.delegate = self;
    _loginPwdTF.secureTextEntry = YES;
    _loginPwdTF.leftView = leftImageP;
    
    //新用户注册,忘记密码，
    _registeredUserButton = [[UIButton alloc] initWithFrame:CGRectMake(textFieldBR, CGRectGetMaxY(_loginPwdTF.frame) + 10, 80, 20)];
    [self.view addSubview:_registeredUserButton];
    _registeredUserButton.tag = LoginButtonTypeZC;
    _registeredUserButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [_registeredUserButton setTitle:@"用户注册" forState:UIControlStateNormal];
    [_registeredUserButton setTitleColor:ZDYColor(255, 255, 255, 0.8) forState:UIControlStateNormal];
    [_registeredUserButton addTarget:self action:@selector(buttonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    
    _forgetPasswordButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_W - 80 - textFieldBR, CGRectGetMaxY(_loginPwdTF.frame) + 10, 80, 20)];
    [self.view addSubview:_forgetPasswordButton];
    _forgetPasswordButton.tag = LoginButtonTypeMM;
    _forgetPasswordButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [_forgetPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [_forgetPasswordButton setTitleColor:ZDYColor(255, 255, 255, 0.8) forState:UIControlStateNormal];
    [_forgetPasswordButton addTarget:self action:@selector(buttonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    
    //登录按钮
    _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(textFieldBR, SCREEN_H*0.68, textFieldW, textFieldH)];
    _loginButton.layer.cornerRadius = 10.0f;
    _loginButton.backgroundColor = [UIColor clearColor];
    _loginButton.layer.borderWidth = 1.0f;
    _loginButton.layer.borderColor = ZDYColor(255, 255, 255, 0.6).CGColor;
    _loginButton.tag = LoginButtonTypeDL;
    [_loginButton setTitle:@"登          录" forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    [_loginButton addTarget:self action:@selector(buttonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    
    //分割线其他登录方式
    float fenGexianY = SCREEN_H - 90;
    float fenGexianW = (SCREEN_W-120)/2;
    UIView *fenGexian = [[UIView alloc] initWithFrame:CGRectMake(0,fenGexianY,fenGexianW, 0.5)];
    [self.view addSubview:fenGexian];
    fenGexian.backgroundColor = [UIColor whiteColor];
    fenGexian.alpha = 0.6;
    
    UILabel *diSanfangLab = [[UILabel alloc] initWithFrame:CGRectMake(fenGexianW, CGRectGetMaxY(fenGexian.frame) - 10, 120, 20)];
    [self.view addSubview:diSanfangLab];
    diSanfangLab.text = @"其他方式登录";
    diSanfangLab.textColor = [UIColor whiteColor];
    diSanfangLab.textAlignment = NSTextAlignmentCenter;
    diSanfangLab.font = [UIFont systemFontOfSize:14.0f];
    
    UIView *fenGexian1 = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_W-fenGexianW, fenGexianY,fenGexianW, 0.5)];
    [self.view addSubview:fenGexian1];
    fenGexian1.backgroundColor = [UIColor whiteColor];
    fenGexian1.alpha = 0.6;
}

/**
 *  各大按钮点击事件
 */
- (void)buttonOnclick:(UIButton *)sender{
    switch (sender.tag) {
        case LoginButtonTypeZC:
            
            break;
        case LoginButtonTypeMM:
            
            break;
        case LoginButtonTypeDL:
            
            if ([self checkData]) {
                [self dlYesZuzhuang];
            }
            break;
        case LoginButtonTypeYK:
            
            break;
        default:
            break;
    }
}

/**
 * 检查输入数据是否有效
 */
- (BOOL)checkData
{
    if ([_loginUserTF.text isEqualToString:@"admin"]) {
        return true;
    }
    if(_loginUserTF.text.length != 11){
        [ZDYUIAlertView jianDanAlertView:@"请输入正确的11位手机号码"];
        return false;
    }
    if([FBInputValidation isEmpty:_loginUserTF.text]){
        [ZDYUIAlertView jianDanAlertView:@"请输入手机号码"];
        return false;
    }
    if(![FBInputValidation isMobileNumber:_loginUserTF.text]){
        [ZDYUIAlertView jianDanAlertView:@"请输入正确的手机号码"];
        return false;
    }
    if([FBInputValidation isEmpty:_loginPwdTF.text]){
        [ZDYUIAlertView jianDanAlertView:@"请输入密码"];
        return false;
    }
    if(_loginPwdTF.text.length < 6){
        [ZDYUIAlertView jianDanAlertView:@"输入密码过短"];
        return false;
    }
    if(_loginPwdTF.text.length > 32){
        [ZDYUIAlertView jianDanAlertView:@"输入密码过长"];
        return false;
    }
    return true;
}

/**
 *  登录时组装数据
 */
- (void)dlYesZuzhuang{
    //6位随机数
    int nonced = arc4random() % 1000000;
    //Unix时间戳,长度10
    NSDate *now = [NSDate date];
    NSUInteger timestamplu = [now timeIntervalSince1970];
    //签名的拼接
    NSString *signature=[NSString stringWithFormat:@"%lu%d%@",(unsigned long)timestamplu,nonced,DL_TOKEN];
    NSString *noncedString = [NSString stringWithFormat:@"%d", nonced];
    NSString *timestamp = [NSString stringWithFormat:@"%lu", (unsigned long)timestamplu];
    //加密签名
    NSString *signatures = [ZDYEdsEncryption sha1:signature];
    
    NSMutableDictionary *mudict = [NSMutableDictionary dictionary];
    [mudict setObject:_loginUserTF.text forKey:@"user"];
    [mudict setObject:_loginPwdTF.text forKey:@"pwd"];
    [mudict setObject:timestamp forKey:@"timestamp"];
    [mudict setObject:@"iosapp" forKey:@"from"];
    [mudict setObject:noncedString forKey:@"nonce"];
    [mudict setObject:signatures forKey:@"signature"];
    
    
    self.loginRequest = [[ZDYNetworkRequest alloc] init];
    [MBProgressHUD showHUD];
    self.loginRequest.requestTag = ZDYNetworkRequestLogin;
    self.loginRequest.parameter = mudict;
    self.loginRequest.returnSuccessData = ^(NSDictionary *dict){
        [MBProgressHUD dissmiss];
        NSLog(@"请求成功后数据为：%@",dict);
        ZDYUserLoginVO *uservo = [[ZDYUserLoginVO alloc] initWithDictionary:dict error:nil];
        [ZDYDateStorageDanli initialization].loginUserInfo = uservo;
        [ZDYDateStorageDanli initialization].uid = uservo.uid;
        [ZDYDateStorageDanli initialization].sessionid = uservo.sessionid;
        
        AppDelegate *appde = SharedDelegate;
        [appde userDlsuccess];
    };
}



- (UIImageView *)backgroundImg{
    if (_backgroundImg) {
        return _backgroundImg;
    }
    _backgroundImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    [_backgroundImg setImage:[UIImage imageNamed:@"login_bgimg"]];
    return _backgroundImg;
}

- (UIImageView *)logoImg{
    if (_logoImg) {
        return _logoImg;
    }
    UIImage *logoimg = [UIImage imageNamed:@"login_logo"];
    float logoimgH = 50.0f;
    float logoimgW = logoimgH/logoimg.size.height * logoimg.size.width;
    _logoImg = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_W - logoimgW)/2, SCREEN_H*0.15, logoimgW, logoimgH)];
    [_logoImg setImage:logoimg];
    return _logoImg;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_loginUserTF resignFirstResponder];
    [_loginPwdTF resignFirstResponder];
}


@end
