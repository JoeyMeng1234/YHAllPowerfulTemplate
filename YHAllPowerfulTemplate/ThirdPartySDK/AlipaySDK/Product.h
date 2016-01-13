//
//  Product.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 16/1/12.
//  Copyright © 2016年 book. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject{
@private
float     _price;
NSString *_subject;
NSString *_body;
NSString *_orderId;
}

@property (nonatomic, assign) float price;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *orderId;

@end
