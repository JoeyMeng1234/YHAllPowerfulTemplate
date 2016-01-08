//
//  YHjPush.m
//  0415-jPush-test
//
//  Created by 王英辉 on 15/10/12.
//  Copyright © 2015年 book. All rights reserved.
//

#import "YHjPush.h"

#define notPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"notData.data"]

#define kJPushReceiveMessageNotification @"kJPushReceiveMessageNotification"

@implementation YHjPush

- (void)networkDidReceiveMessage:(NSNotification *)notification
{
    /*
     其中，kJPFNetworkDidReceiveMessageNotification通知是有传递数据的，可以通过NSNotification中的userInfo方法获取，包括标题、内容、内容类型、扩展信息等
    */
    NSDictionary *userInfo = [notification userInfo];
    
    // 改变通知字典的结构
    NSMutableDictionary *filtrationDict = [NSMutableDictionary dictionary];
    [filtrationDict addEntriesFromDictionary:[userInfo valueForKey:@"extras"]];
    [filtrationDict  addEntriesFromDictionary:@{@"aps":@{@"alert":[userInfo valueForKey:@"content"]}}];
    
    NSLog(@"APNs推送的内容：%@",filtrationDict);
    
    [self checkNotification:filtrationDict];
}

- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [super didReceiveRemoteNotification:userInfo];
    
    [self checkNotification:userInfo];
    
}

- (void)checkNotification:(NSDictionary *)userInfo
{
    NSMutableDictionary *notListDict = [NSMutableDictionary dictionaryWithContentsOfFile:notPath];
    if (!notListDict) {
        notListDict = [NSMutableDictionary dictionary];
    }
    NSString *nid = userInfo[@"_j_msgid"];
    
    if (notListDict[@"_j_msgid"]) {
        return;
    }
    if (!nid) {
        return;
    }
    
    [notListDict addEntriesFromDictionary:@{nid:userInfo}];
    [notListDict writeToFile:notPath atomically:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kJPushReceiveMessageNotification object:nil userInfo:userInfo];
}

- (void)dealloc
{
    NSLog(@"dealloc- YHBasejPush");
}
@end
