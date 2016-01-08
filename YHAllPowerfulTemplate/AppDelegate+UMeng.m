//
//  AppDelegate+UMeng.m
//  zhagen
//
//  Created by 王英辉 on 15/6/17.
//  Copyright (c) 2015年 BDog. All rights reserved.
//

#import "AppDelegate+UMeng.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaHandler.h"
//#import "UMSocialSinaSSOHandler.h"
@implementation AppDelegate (UMeng)

- (void)addUMengWithapplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UMSocialData setAppKey:YOUMENGAPY];
    
    // 添加分享平台开关方法
    [self addSwithMethod];
    
}

// 添加分享平台开关方法
- (void)addSwithMethod
{
    
    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:WX_APPKEY appSecret:WX_APP_SECRET url:REDIRECT_URI];

    //设置手机QQ 的AppId，Appkey，和分享URL，需要#import "UMSocialQQHandler.h"
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];
    
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。若在新浪后台设置我们的回调地址，“http://sns.whalecloud.com/sina2/callback”，这里可以传nil ,需要 #import "UMSocialSinaHandler.h"
    [UMSocialSinaHandler openSSOWithRedirectURL:nil];
    
}

// 步骤2. 在AppDelegate文件里面实现下面三个系统回调方法
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url];
}



@end
