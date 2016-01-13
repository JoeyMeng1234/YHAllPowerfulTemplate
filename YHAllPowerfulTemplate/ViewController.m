//
//  ViewController.m
//  YHAllPowerfulTemplate
//
//  Created by 王英辉 on 15/10/27.
//  Copyright © 2015年 book. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+mob.h"
#include "UIViewController+WXPay.h"
#import "UIViewController+AliPay.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"分享" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(share1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)share1:(UIButton *)button
{
//    [self share:button];
//    [self login:button];
    
    
//    NSString *res = [self jumpToBizPay];
//    if( ![@"" isEqual:res] ){
//        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"支付失败" message:res delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        
//        [alter show];
//    }
    [self aliPay];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
