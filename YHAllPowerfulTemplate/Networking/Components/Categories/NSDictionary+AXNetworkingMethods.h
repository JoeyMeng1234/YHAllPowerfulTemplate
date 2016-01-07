//
//  NSDictionary+AXNetworkingMethods.h
//  YHNetworking
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSDictionary (AXNetworkingMethods)

- (NSString *)AIF_urlParamsStringSignature:(BOOL)isForSignature;
- (NSString *)AIF_jsonString;
- (NSArray *)AIF_transformedUrlParamsArraySignature:(BOOL)isForSignature;

@end
