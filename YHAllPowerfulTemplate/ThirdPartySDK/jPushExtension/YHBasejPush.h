//
//  YHjPush.h
//  0415-jPush-test
//
//  Created by 王英辉 on 15/10/12.
//  Copyright © 2015年 book. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APService.h"

@interface YHBasejPush : NSObject


- (instancetype)initWithApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
+ (instancetype)jPushWithApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

/*
 * 向服务器上报Device Token
 */
- (void)registerDeviceToken:(NSData *)deciceToken;

/*
 * 清除导航栏通知信息
 */
+ (void)clearNotificationBarNotification;

/*
 * 远程通知
 */
- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo;


- (NSString *)logDic:(NSDictionary *)dic;

/**
 *  建立连接
 *
 *  @param notification 通知
 */
- (void)networkDidSetup:(NSNotification *)notification;
/**
 *  关闭连接
 *
 *  @param notification 通知
 */
- (void)networkDidClose:(NSNotification *)notification;

/**
 *  注册成功
 *
 *  @param notification 通知
 */
- (void)networkDidRegister:(NSNotification *)notification;

/**
 *  登录成功
 *
 *  @param notification 通知
 */
- (void)networkDidLogin:(NSNotification *)notification;

/**
 *  收到消息
 *
 *  @param notification 通知
 */
- (void)networkDidReceiveMessage:(NSNotification *)notification;

@end
