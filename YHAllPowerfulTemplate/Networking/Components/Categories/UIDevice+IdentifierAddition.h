//
//  UIDevice(Identifier).h
//  UIDeviceAddition
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIDevice (IdentifierAddition)

/*
 * @method uuid
 * @description apple identifier support iOS6 and iOS5 below
 */

- (NSString *) AIF_uuid;
- (NSString *) AIF_udid;
- (NSString *) AIF_macaddress;
- (NSString *) AIF_macaddressMD5;
- (NSString *) AIF_machineType;
- (NSString *) AIF_ostype;//显示“ios6，ios5”，只显示大版本号
- (NSString *) AIF_createUUID;

//兼容旧版本
- (NSString *) uuid;
- (NSString *) udid;
- (NSString *) macaddress;
- (NSString *) macaddressMD5;
- (NSString *) machineType;
- (NSString *) ostype;//显示“ios6，ios5”，只显示大版本号
- (NSString *) createUUID;
@end
