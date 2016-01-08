//
//  FDMHouseSouceInfoViewController+UMeng.h
//  zhagen
//
//  Created by 王英辉 on 15/6/17.
//  Copyright (c) 2015年 BDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UMeng)

/**
 * 分享
 * para  text 分享的文字内容
 * para title 分享的标题
 * para ImageName 分享的图片地址
 * para url 资源地址
 * return nil
 */
- (void)shareWithText:(NSString *)text title:(NSString *)title shareImage:(UIImage *)image  url:(NSString *)url;


// 新浪
- (void)loginSina;

//qq
- (void)loginQQ;
//
//WeChat
- (void)loginWeChat;
@end
