//
//  UIViewController+mob.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 16/1/8.
//  Copyright © 2016年 book. All rights reserved.
//

#import "UIViewController+mob.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
// 导入头文件
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>

@implementation UIViewController (mob)

- (void)share:(UIButton *)sender
{

    //1、创建分享参数
    NSArray* imageArray = @[@"http://mob.com/Assets/images/logo.png?v=20150320"];
    //（注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end)
        {
            switch (state)
            {
                case SSDKResponseStateSuccess:
                {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"                                                                        message:nil
                      delegate:nil                                                                cancelButtonTitle:@"确定"
                   otherButtonTitles:nil];
                    [alertView show];
                    break;
                }
                case SSDKResponseStateFail:
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败" message:[NSString stringWithFormat:@"%@",error] delegate:nil
                        cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                    break;
                }
                default:
                    break;
            }
        }];
    }
}

- (void)login:(UIButton *)sender
{

    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeQQ
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       
                                       //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
                                       //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
                                       associateHandler (user.uid, user, user);
                                       NSLog(@"dd%@",user.rawData);
                                       NSLog(@"dd%@",user.credential);
                                       
                                   }
                                onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                    
                                    if (state == SSDKResponseStateSuccess)
                                    {
                                        
                                    }
                                    
                                }];
    
}
@end
