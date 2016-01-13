//
//  AppDelegate+AliPay.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 16/1/12.
//  Copyright © 2016年 book. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AliPay)


- (void)addAliPayWithapplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (BOOL)AliPayWithApplication:(UIApplication *)application handleOpenURL:(NSURL *)url;

- (BOOL)AliPayWithApplication:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;


@end
