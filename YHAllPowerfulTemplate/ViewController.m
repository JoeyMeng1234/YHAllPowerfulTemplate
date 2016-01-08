//
//  ViewController.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+UMeng.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 分享
    //[self shareWithText:@"你哈市打发；上来看打飞机啊；了深刻的减肥；阿拉山口打飞机；阿斯利康的减肥；阿什利的会计法；lj" title:@"测试" shareImage:[UIImage imageNamed:@"10.jpg"] url:@"fjalksdfjalsdfkjal;sdfj"];
    
    // 登陆Sina
    [self loginSina];
    
//    // 登陆QQ
//    [self loginQQ];
    
//    // 登陆weChat
//    [self loginWeChat];
    
    
}

@end
