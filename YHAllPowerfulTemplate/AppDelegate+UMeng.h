//
//  AppDelegate+UMeng.h
//  zhagen
//
//  Created by 王英辉 on 15/6/17.
//  Copyright (c) 2015年 BDog. All rights reserved.
//

#import "AppDelegate.h"

#define YOUMENGAPY @"5580fce467e58e0614003399"
#define WX_APPKEY @"wx0abcf6b5fcd82284"
#define WX_APP_SECRET @"4ce0e0eea4a6b46980c8be25a48c4bd1"
#define QQ_APPKEY @"1104577527"
#define QQ_APP_SECRET @"OUzkVne55t4sFVSV"
#define TW_APPKEY @"801566838"
#define TW_APP_SECRET @"6d0043e629e2f84b3a3ba5d2f6952eb8"
#define REDIRECT_URI @"www.baidu.com"
#define SINA_APPKEY @"178756640"
#define SINA_APP_SECRET @"85348a69e5e84725a21f8eded16eb771"

@interface AppDelegate (UMeng)

- (void)addUMengWithapplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
