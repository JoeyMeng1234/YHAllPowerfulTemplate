//
//  AXServiceFactory.h
//  YHNetworking
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AIFService.h"

@interface AIFServiceFactory : NSObject

+ (instancetype)sharedInstance;
- (AIFService<AIFServiceProtocal> *)serviceWithIdentifier:(NSString *)identifier;

@end
