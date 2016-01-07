//
//  NSURLRequest+AIFNetworkingMethods.m
//  YHNetworking
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//


#import "NSURLRequest+AIFNetworkingMethods.h"
#import <objc/runtime.h>

static void *AIFNetworkingRequestParams;

@implementation NSURLRequest (AIFNetworkingMethods)

- (void)setRequestParams:(NSDictionary *)requestParams
{
    objc_setAssociatedObject(self, &AIFNetworkingRequestParams, requestParams, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *)requestParams
{
    return objc_getAssociatedObject(self, &AIFNetworkingRequestParams);
}

@end
