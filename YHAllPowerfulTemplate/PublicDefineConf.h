//
//  PublicDefineConf.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 16/1/7.
//  Copyright © 2016年 book. All rights reserved.
//

#ifndef PublicDefineConf_h
#define PublicDefineConf_h

// 1.RGBA颜色
#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define hexColor(colorV) [UIColor colorWithHexColorString:@#colorV]
#define hexColorAlpha(colorV,a) [UIColor colorWithHexColorString:@#colorV alpha:a];


// 2.NSLog输出信息
/****  debug log **/
#ifdef DEBUG

#define DLog(...) NSLog(@"%s %d \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define DLog( s, ... )
#endif


// 3.iOS 调试_模拟器与真机的区分
#if TARGET_IPHONE_SIMULATOR
//模拟器
#elif TARGET_OS_IPHONE
//真机
#endif

// 4.ios系统版本
#define ios8x [[[UIDevice currentDevice] systemVersion] floatValue] >=8.0f
#define ios7x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
#define ios6x [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0f
#define iosNot6x [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f

// 5.设备机型
#define iphone4x_3_5 ([UIScreen mainScreen].bounds.size.height==480.0f)

#define iphone5x_4_0 ([UIScreen mainScreen].bounds.size.height==568.0f)

#define iphone6_4_7 ([UIScreen mainScreen].bounds.size.height==667.0f)

#define iphone6Plus_5_5 ([UIScreen mainScreen].bounds.size.height==736.0f || [UIScreen mainScreen].bounds.size.height==414.0f)

// 6.屏幕宽高
#define kScreenW [[UIScreen mainScreen] bounds].size.width
#define kScreenH [[UIScreen mainScreen] bounds].size.height

// 7.屏幕frame,bounds,size
#define kScreenFrame [UIScreen mainScreen].bounds
#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenSize [UIScreen mainScreen].bounds.size

#endif /* PublicDefineConf_h */
