//
//  AppDelegate+WXPay.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 16/1/11.
//  Copyright © 2016年 book. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (WXPay)

- (void)addWXPayWithapplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (BOOL)WXPayWithApplication:(UIApplication *)application handleOpenURL:(NSURL *)url;

- (BOOL)WXPayWithApplication:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
@end
