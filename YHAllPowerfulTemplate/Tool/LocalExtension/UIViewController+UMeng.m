//
//  FDMHouseSouceInfoViewController+UMeng.m
//  zhagen
//
//  Created by 王英辉 on 15/6/17.
//  Copyright (c) 2015年 BDog. All rights reserved.
//

#import "UIViewController+UMeng.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialConfig.h"
#include "AppDelegate+UMeng.h"

@interface UIViewController ()<UMSocialUIDelegate>

@end

@implementation UIViewController (UMeng)

#pragma mark - share
- (void)shareWithText:(NSString *)text title:(NSString *)title shareImage:(UIImage *)image  url:(NSString *)url
{
    //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
    
    //    App Key：1657966813
    //    App Secret：14bcd40ddda8166bc12c7aaa032b8ace
    
//    NSString *subText = [[text substringToIndex:10] stringByAppendingString:url];
    
    
    if (text.length>50) {
        
        NSString *subText = [[text substringToIndex:50] stringByAppendingString:url];
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:@"5580fce467e58e0614003399"
                                          shareText:subText
                                         shareImage:image
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,
                                                     UMShareToSina,nil]
                                           delegate:self];
        
    }else{
    
        NSString *subText = [text stringByAppendingString:url];
        [UMSocialSnsService presentSnsIconSheetView:self
                                             appKey:@"5580fce467e58e0614003399"
                                          shareText:subText
                                         shareImage:image
                                    shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,
                                                     UMShareToSina,nil]
                                           delegate:self];
    }
    
    

    //    [UMSocialData defaultData].commentImage = shareImage;
    
    //    //微信应用分享
    //    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeWeb;
    
    //qq空间分享标题
    [UMSocialData defaultData].extConfig.qzoneData.title = @"易驾";
    
    
    // QQ设置点击分享内容跳转链接调用下面的方法
    
    [UMSocialData defaultData].extConfig.qqData.url = url;
    
    // Qzone设置点击分享内容跳转链接替换平台参数名即可
    
    [UMSocialData defaultData].extConfig.qzoneData.url = url;
    
    //分享到微信收藏中内容链接
    [UMSocialData defaultData].extConfig.wechatFavoriteData.url = url;
    [UMSocialData defaultData].extConfig.wechatFavoriteData.title = title;
    //分享到微信好友中内容链接
    [UMSocialData defaultData].extConfig.wechatSessionData.url = url;
    [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
    //分享到微信朋友圈内容链接
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = url;
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = title;
    //分享到微博中内容
    [UMSocialData defaultData].extConfig.tencentData.urlResource.url = url;

    //分享到微博中内容
    [UMSocialData defaultData].extConfig.sinaData.urlResource.url = url;
    
    //    [UMSocialData defaultData].extConfig.sinaData.shareImage = shareImage;
    
    //    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:shareUrl];
}

//弹出列表方法presentSnsIconSheetView需要设置delegate为self
-(BOOL)isDirectShareInIconActionSheet
{
    return YES;
}


-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
        //提示语位置
        [UMSocialConfig setFinishToastIsHidden:NO position:1000003];
    }
}


#pragma mark - login
// 新浪
- (void)loginSina
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    
    //获取accestoken以及新浪用户信息，得到的数据在回调Block对象形参respone的data属性
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToSina  completion:^(UMSocialResponseEntity *response){
        
        NSLog(@"SnsInformation is %@",response.data);
        
    }];
}

//qq
- (void)loginQQ
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    
    //获取accestoken以及QQ用户信息，得到的数据在回调Block对象形参respone的data属性
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToQQ  completion:^(UMSocialResponseEntity *response){
        NSLog(@"SnsInformation is %@",response.data);
    }];
}

//WeChat
- (void)loginWeChat
{
    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:WX_APPKEY appSecret:WX_APP_SECRET url:REDIRECT_URI];
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:UMShareToWechatSession];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }
        
    });
    
    
    //得到的数据在回调Block对象形参respone的data属性
    [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToWechatSession  completion:^(UMSocialResponseEntity *response){
        NSLog(@"SnsInformation is %@",response.data);
    }];
}
@end
