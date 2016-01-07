//
//  Header.h
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/11/2.
//  Copyright © 2015年 book. All rights reserved.
//

#ifndef Header_h
#define Header_h

// 1.RGBA颜色
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)];


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


#endif /* Header_h */
