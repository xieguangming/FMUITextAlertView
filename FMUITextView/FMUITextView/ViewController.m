//
//  ViewController.m
//  FMUITextView
//
//  Created by xgm on 2018/1/2.
//  Copyright © 2018年 www.auratech.hk. All rights reserved.
//

#import "ViewController.h"
#import "JPSalertView.h"
#define Width  [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#define KSCALE  /375.0 * Width

@interface ViewController ()<JPSalertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 点击按钮
- (IBAction)ClickAction:(UIButton *)sender {
    
    JPSalertView *alertView = [[JPSalertView alloc] initWithsFrame:CGRectMake(0, 0, Width - 80 KSCALE, 190 KSCALE) AndTitle:@"Please enter group name"];
    alertView.flags = 101;
    alertView.center = self.view.center;
    alertView.delegate = self;
    alertView.backgroundColor = [UIColor whiteColor];
    [alertView showView];
}

#pragma mark - JPSalertViewDelegate
-(void)CreateGroupByname:(NSString *)name{
    NSLog(@"name:%@",name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
