//
//  UIViewController+AliPay.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 16/1/12.
//  Copyright © 2016年 book. All rights reserved.
//

#import "UIViewController+AliPay.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>

#import "APAuthV2Info.h"
#import "Product.h"

@implementation UIViewController (AliPay)

- (void)aliPay
{

    
    /*
     *点击获取prodcut实例并初始化订单信息
     */
    Product *product = [[Product alloc] init];
    product.subject = @"1";
    product.body = @"我是测试数据";
    product.price = 0.01f+pow(10,1);
    
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = @"2088811455214328";
    NSString *seller = @"chenxiaomeng@zhihedongfang.com";
    NSString *privateKey = @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAOXvZXUrs4NaUGtzGpWc3Opi/+25yeHsLAEfQJmKSU/GvrpPCQFa4jxveFVO87EpPvfudsuB2iaFPubPFcHrPloh32AO64u676AiIT7lCNgKPkl7+FGN0k09h+80JYNP8hMWRJRQNHHdn4X+LKTvyN4seISJif9GLxQGzqnIf4jbAgMBAAECgYAwSJ8jhbPCh3qPtbIFbNUvGu7nOrZcDL4I1kk4dMOETxXKBcK8WBtd2YKJV3Tw5NpmMdscTP5ETIKy8RV+jSmgWbIP2I+pKRxEcwhwnePCJoJdxfnCZ65fDfRjfe7noo3KAIOe3tGXBjFH3QSpfO47huEjajwee1BEwapjcfnIMQJBAP2KezQajx9kDy2g2AMPd1CKQCn/0Q82xbP+KmQ4NkAClF0hQVa19UnkboGCqD++7A1Xrdl8lomddotYxtlCodUCQQDoKk3VIiI01ftyFdtAF89T3dksCAvL3ZcCDUt7/NK1bd3GBH5YnaqaMtmcgDKaikpsRtsD2B6smCloR3j4lyfvAkEA92e9Z4+PH7OU+BJfF0VtSWNOz2z4xN7OtyAKn7cWgQnDWslLp+Bw1cUZbDliEqosT6zCUVq4ztqfxcRAbdsObQJBAKsB5hy0rL+AUlrhUILwRs2+nmW5c37xtHZVdqFYQ5hR2cYuryX01KIKDJIjN6LvdAw3UMGPImD9H5ro8mkhZc8CQHHnMU7nMJjU0+EVpAc+v3zEhbRNjsvfS7fSyGHfH+NVR1ZuFJQVCyYGmfKO4V6qt3eUkDuJp2Ycxo3IOueC07U=";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.productName = product.subject; //商品标题
    order.productDescription = product.body; //商品描述
    order.amount = [NSString stringWithFormat:@"%.2f",product.price]; //商品价格
    order.notifyURL =  @"http://www.xxx.com"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"alisdkdemo";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);

    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
        
    }

    
}

#pragma mark -
#pragma mark   ==============产生随机订单号==============


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}
@end
