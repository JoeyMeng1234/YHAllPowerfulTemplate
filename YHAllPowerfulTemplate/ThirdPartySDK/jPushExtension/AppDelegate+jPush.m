//
//  AppDelegate+jPush.m
//  0415-jPush-test
//
//  Created by 王英辉 on 15/4/15.
//  Copyright (c) 2015年 book. All rights reserved.
//

#import "AppDelegate+jPush.h"
#import "YHjPush.h"


@implementation AppDelegate (jPush)

static YHjPush *jPush = nil;

- (void)addjPushWithapplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    jPush = [YHjPush jPushWithApplication:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    [jPush didReceiveRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [jPush registerDeviceToken:deviceToken];
}

@end
