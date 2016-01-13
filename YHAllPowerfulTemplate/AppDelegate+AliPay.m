//
//  AppDelegate+AliPay.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 16/1/12.
//  Copyright © 2016年 book. All rights reserved.
//

#import "AppDelegate+AliPay.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation AppDelegate (AliPay)

- (void)addAliPayWithapplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
}

- (BOOL)AliPayWithApplication:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return YES;
}

- (BOOL)AliPayWithApplication:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开发包
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
        }];
    }
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回authCode
        
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            NSLog(@"result = %@",resultDic);
        }];
    }
    return YES;
}

@end
