//
//  AppDelegate+WXPay.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 16/1/11.
//  Copyright © 2016年 book. All rights reserved.
//

#import "AppDelegate+WXPay.h"
#import "WXApi.h"

@interface AppDelegate () <WXApiDelegate>

@end
@implementation AppDelegate (WXPay)

- (void)addWXPayWithapplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //向微信注册wxd930ea5d5a258f4f
    [WXApi registerApp:@"wxb4ba3c02aa476ea1" withDescription:@"demo 2.0"];
}
- (BOOL)WXPayWithApplication:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSLog(@"微信");
    //微信支付回调
    return [WXApi handleOpenURL:url delegate:self];

}

- (BOOL)WXPayWithApplication:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"微信");
    return [WXApi handleOpenURL:url delegate:self];
}


#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp {

    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        NSString *strMsg,*strTitle = [NSString stringWithFormat:@"支付结果"];
        
        switch (resp.errCode) {
            case WXSuccess:
                strMsg = @"支付结果：成功！";
                NSLog(@"支付成功－PaySuccess，retcode = %d", resp.errCode);
                break;
                
            default:
                strMsg = [NSString stringWithFormat:@"支付结果：失败！retcode = %d, retstr = %@", resp.errCode,resp.errStr];
                NSLog(@"错误，retcode = %d, retstr = %@", resp.errCode,resp.errStr);
                break;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}
@end
