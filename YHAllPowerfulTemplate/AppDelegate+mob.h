//
//  AppDelegate+mob.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 16/1/8.
//  Copyright © 2016年 book. All rights reserved.
//

#import "AppDelegate.h"

/**********************总宏定义*********************/
/**
 *  Mob_App_Key
 */
#define App_Key  @"c378a36d9e50"

#define App_Secret  @"8e237eec4d8edaf13c4b5a8b06d35d18"

/**
 *  微信登陆
 */
#define WX_AppID  @"wx5484d4cf32e57047"

#define WX_AppSecret  @"d4624c36b6795d1d99dcf0547af5443d"

/**
 *  QQ登陆
 */
#define QQ_AppID   @"1104890545"

#define QQ_AppSecret  @"FGj2XCkTCQY94j9B"

/**
 *  新浪微博登陆
 */
#define Sina_AppID  @"864297095"

#define Sina_AppSectrt  @"6337636b4d13d2dba0a03d9e4e5c5ebb"

#define RedirectUri  @"http://www.sharesdk.cn"


@interface AppDelegate (mob)

- (void)addMobWithapplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end

