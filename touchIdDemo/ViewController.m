//
//  ViewController.m
//  touchIdDemo
//
//  Created by 阎辉 on 2016/12/6.
//  Copyright © 2016年 阎辉. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)LAContext *laContext;
//@property (nonatomic, strong)NSError *error;
@end

@implementation ViewController
/*
 
 验证设备是否支持Touch ID
 - (BOOL)canEvaluatePolicy:(LAPolicy)policy error:(NSError * __autoreleasing *)error;
 
 进行验证的回调
 - (void)evaluatePolicy:(LAPolicy)policy localizedReason:(NSString *)localizedReason reply:(void(^)(BOOL success, NSError *error))reply;
 
 取消Touch Id验证的按钮的标题，默认标题是输入密码
 @property (nonatomic, copy) NSString *localizedFallbackTitle;
 
 
 typedef NS_ENUM(NSInteger, LAError)
 {
 用户验证没有通过，比如提供了错误的手指的指纹
 LAErrorAuthenticationFailed = kLAErrorAuthenticationFailed,
 
 用户取消了Touch ID验证
 LAErrorUserCancel           = kLAErrorUserCancel,
 
 用户不想进行Touch ID验证，想进行输入密码操作
 LAErrorUserFallback         = kLAErrorUserFallback,
 
 系统终止了验证
 LAErrorSystemCancel         = kLAErrorSystemCancel,
 
 用户没有在设备Settings中设定密码
 LAErrorPasscodeNotSet       = kLAErrorPasscodeNotSet,
 
 设备不支持Touch ID
 LAErrorTouchIDNotAvailable  = kLAErrorTouchIDNotAvailable,
 
 设备没有进行Touch ID 指纹注册
 LAErrorTouchIDNotEnrolled   = kLAErrorTouchIDNotEnrolled,
 } NS_ENUM_AVAILABLE(10_10, 8_0);
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _laContext = [[LAContext alloc] init];
    
}
- (IBAction)touchIdAction:(UIButton *)sender {
    NSError *error = nil;
    _laContext = [[LAContext alloc]init];
    //验证是否支持
    if ([_laContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        //进行验证的回调
        [_laContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Touch Id Test" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                NSLog(@"---success to evaluate---");
            }
            if (error) {
                NSLog(@"---failed to evaluate---error: %@---", error.description);
            }
        }];
    }else{
        NSLog(@"no evaluate touch ID");
    }
    _laContext = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
