//
//  YHjPush.m
//  0415-jPush-test
//
//  Created by 王英辉 on 15/10/12.
//  Copyright © 2015年 book. All rights reserved.
//

#import "YHBasejPush.h"


@implementation YHBasejPush

- (instancetype)initWithApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if (self = [super init]) {
        [self registerWithjPushWithApplication:application didFinishLaunchingWithOptions:launchOptions];
        
        [self rigisterNotification];
    }
    return self;
}

+ (instancetype)jPushWithApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return [[self alloc] initWithApplication:application didFinishLaunchingWithOptions:launchOptions];
}

// 注册jPush
- (void)registerWithjPushWithApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Required
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [APService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                       UIUserNotificationTypeSound |
                                                       UIUserNotificationTypeAlert)
                                           categories:nil];
    } else {
        //categories 必须为nil
        [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                       UIRemoteNotificationTypeSound |
                                                       UIRemoteNotificationTypeAlert)
                                           categories:nil];
    }
#else
    //categories 必须为nil
    [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                   UIRemoteNotificationTypeSound |
                                                   UIRemoteNotificationTypeAlert)
                                       categories:nil];
#endif
    // Required
    [APService setupWithOption:launchOptions];

}

- (void)registerDeviceToken:(NSData *)deciceToken
{
    [APService registerDeviceToken:deciceToken];
}

/*
 * 清除导航栏通知信息
 */
+ (void)clearNotificationBarNotification
{
    [UIApplication sharedApplication].applicationIconBadgeNumber = [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}


- (void)dealloc
{
    [self removeAllNotification];
    
    NSLog(@"dealloc- YHBasejPush");
}
/**
 *  注册通知
 */
- (void)rigisterNotification
{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    // 建立连接
    [defaultCenter addObserver:self
                      selector:@selector(networkDidSetup:)
                          name:kJPFNetworkDidSetupNotification
                        object:nil];
    // 关闭连接
    [defaultCenter addObserver:self
                      selector:@selector(networkDidClose:)
                          name:kJPFNetworkDidCloseNotification
                        object:nil];
    // 注册成功
    [defaultCenter addObserver:self
                      selector:@selector(networkDidRegister:)
                          name:kJPFNetworkDidRegisterNotification
                        object:nil];
    // 登录成功
    [defaultCenter addObserver:self
                      selector:@selector(networkDidLogin:)
                          name:kJPFNetworkDidLoginNotification
                        object:nil];
    // 收到消息
    [defaultCenter addObserver:self
                      selector:@selector(networkDidReceiveMessage:)
                          name:kJPFNetworkDidReceiveMessageNotification
                        object:nil];
    // 发生错误
    [defaultCenter addObserver:self
                      selector:@selector(serviceError:)
                          name:kJPFServiceErrorNotification
                        object:nil];
}

/**
 *  移除全部通知
 */
- (void)removeAllNotification
{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidSetupNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidCloseNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidRegisterNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidLoginNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidReceiveMessageNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFServiceErrorNotification
                           object:nil];
    
}

/**
 *  建立连接
 *
 *  @param notification 通知
 */
- (void)networkDidSetup:(NSNotification *)notification {
    
    NSLog(@"已连接");
    
}

/**
 *  关闭连接
 *
 *  @param notification 通知
 */
- (void)networkDidClose:(NSNotification *)notification {
    
    NSLog(@"未连接");
    
}

/**
 *  注册成功
 *
 *  @param notification 通知
 */
- (void)networkDidRegister:(NSNotification *)notification {
    NSLog(@"%@", [notification userInfo]);
    
    [[notification userInfo] valueForKey:@"RegistrationID"];
    
    NSLog(@"已注册");
}

/**
 *  登录成功
 *
 *  @param notification 通知
 */
- (void)networkDidLogin:(NSNotification *)notification {
    
    NSLog(@"已登录");
    
    if ([APService registrationID]) {
        
        NSLog(@"get RegistrationID：%@",[APService registrationID]);
    }
    
    [APService setTags:nil alias:@"" callbackSelector:@selector(tagsAliasCallback:tags:alias:) object:self];
}

/**
 *  收到消息
 *
 *  @param notification 通知
 */
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSLog(@"");
}

// log NSSet with UTF8
// if not ,log will be \Uxxx
/**
 *  将字典装成字符串
 *
 *  @param dic 字典
 *
 *  @return 返回字符串
 */
- (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    return str;
}

/*
 * apns通知
 */
- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // IOS 7 Support Required
    [APService handleRemoteNotification:userInfo];
}
/**
 *  发生错误
 *
 *  @param notification 通知
 */
- (void)serviceError:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSString *error = [userInfo valueForKey:@"error"];
    NSLog(@"%@", error);
}

@end
