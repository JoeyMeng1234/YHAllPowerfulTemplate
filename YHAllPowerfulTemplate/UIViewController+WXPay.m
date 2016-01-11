
//
//  UIViewController+WXPay.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 16/1/11.
//  Copyright © 2016年 book. All rights reserved.
//

#import "UIViewController+WXPay.h"
#import "WXApi.h"

@implementation UIViewController (WXPay)

- (NSString *)jumpToBizPay {
    
    //============================================================
    // V3&V4支付流程实现
    // 注意:参数配置请查看服务器端Demo
    // https://pay.weixin.qq.com/wiki/doc/api/app.php?chapter=9_12
    // 更新时间：2015年11月20日
    //============================================================
    NSString *urlString   = @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php?plat=ios";
    //解析服务端返回json数据
    NSError *error;
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if ( response != nil) {
        NSMutableDictionary *dict = NULL;
        //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
        dict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
        
        NSLog(@"url:%@",urlString);
        if(dict != nil){
            NSMutableString *retcode = [dict objectForKey:@"retcode"];
            if (retcode.intValue == 0){
                NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
                
                //调起微信支付
                PayReq* req             = [[PayReq alloc] init];
                req.partnerId           = [dict objectForKey:@"partnerid"];     // 商户号(微信支付分配的商户号)
                req.prepayId            = [dict objectForKey:@"prepayid"];      // 预支付交易会话ID(微信返回的支付交易会话ID)
                req.nonceStr            = [dict objectForKey:@"noncestr"];      // 随机字符串 (随机字符串，不长于32位。推荐随机数生成算法)
                req.timeStamp           = stamp.intValue;                       // 时间戳
                req.package             = [dict objectForKey:@"package"];       // 扩展字段(暂填写固定值Sign=WXPay)
                req.sign                = [dict objectForKey:@"sign"];          // 签名
                [WXApi sendReq:req];
                //日志输出
                NSLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",[dict objectForKey:@"appid"],req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign );
                return @"";
            }else{
                return [dict objectForKey:@"retmsg"];
            }
        }else{
            return @"服务器返回错误，未获取到json对象";
        }
    }else{
        return @"服务器返回错误";
    }
}

@end
