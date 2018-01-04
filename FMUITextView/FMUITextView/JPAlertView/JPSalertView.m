//
//  JPSalertView.m
//  PopViewOne
//
//  Created by 姜朋升 on 2017/5/22.
//  Copyright © 2017年 闪牛网络. All rights reserved.
//

#import "JPSalertView.h"
#import "UIView+Frame.h"
#import "UIFont+runtime.h"
#define Width  [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#define KSCALE  /375.0 * Width
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface JPSalertView()<UITextFieldDelegate>

@property(nonatomic,strong)UIView *bgView;

@property(nonatomic,strong)NSString *titleStr;

@end
@implementation JPSalertView

- (instancetype)initWithsFrame:(CGRect)frame  AndTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    self.titleStr = title;
    if (self) {
        [self createView];
    }
    return self;
}

-(void)createView
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 8;
    self.clipsToBounds = YES;
    
    //1. 标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 KSCALE, 10 KSCALE, self.frame.size.width -20 KSCALE, 30 KSCALE)];
    self.titleLabel.text = self.titleStr;
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont adjustFont:16];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    //2. 下划线图
    self.lineView  = [[UIImageView alloc]init];
    self.lineView.frame = CGRectMake(10 KSCALE, 40 KSCALE, self.frame.size.width -20 KSCALE, 3);
    self.lineView.image = [UIImage imageNamed:@"BBS_line"];
    [self addSubview:self.lineView];
    
    //3.输入框
    FMTextField *textField = [[FMTextField alloc] initWithFrame:CGRectMake(10 KSCALE, 65 KSCALE, self.frame.size.width -20 KSCALE, 35 KSCALE)];
    textField.contentVerticalAlignment= UIControlContentVerticalAlignmentCenter;
    textField.returnKeyType = UIReturnKeyDone;
    textField.background = [UIImage imageNamed:@"TextField_bg"];
    textField.clearButtonMode = YES;
    textField.placeholder = @" Please input 1-20 characters";
    textField.delegate = self;
    UILabel *label = [textField valueForKey:@"_placeholderLabel"];
    label.adjustsFontSizeToFitWidth = YES;
    [textField addTarget:self action:@selector(textField:) forControlEvents:UIControlEventEditingChanged];
    self.textField = textField;
    [self addSubview:self.textField];
    
    
    //确定按钮
    UIButton *ComfrimBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ComfrimBtn.layer.masksToBounds = YES;
    ComfrimBtn.layer.cornerRadius = 5;
    ComfrimBtn.frame = CGRectMake(30 KSCALE, 130 KSCALE, 80 KSCALE, 40 KSCALE);
    [ComfrimBtn setTitle:@"OK" forState:UIControlStateNormal];
    [ComfrimBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    ComfrimBtn.backgroundColor = [UIColor redColor];
    [ComfrimBtn addTarget:self action:@selector(OKAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:ComfrimBtn];
    
    //取消按钮
    UIButton *CancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CancelBtn.layer.masksToBounds = YES;
    CancelBtn.layer.cornerRadius = 5;
    CancelBtn.frame = CGRectMake(self.bounds.size.width -110 KSCALE, 130 KSCALE, 80 KSCALE, 40 KSCALE);
    [CancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [CancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    CancelBtn.backgroundColor = UIColorFromRGB(0xcdcdcd);
    [CancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:CancelBtn];
    
    CancelBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    ComfrimBtn.titleLabel.font = [UIFont systemFontOfSize:12];
}

#pragma mark ====展示view
- (void)showView
{
    if (self.bgView) {
        return;
    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.bgView addGestureRecognizer:tap];
    self.bgView.userInteractionEnabled = YES;
    self.bgView.backgroundColor = [UIColor blackColor];
    self.bgView.alpha = 0.4;
    [window addSubview:self.bgView];
    [window addSubview:self];
    
}
-(void)tap:(UIGestureRecognizer *)tap
{
    [self.bgView removeFromSuperview];
    self.bgView = nil;
    [self removeFromSuperview];
}

- (void)closeView
{
    [self.bgView removeFromSuperview];
    self.bgView = nil;
    [self removeFromSuperview];
}

- (void)textField:(id)sender{
    
}

#pragma mark - 取消动作
-(void)cancelAction:(UIButton *)sender{
    [self closeView];
}

#pragma mark - 确定动作
-(void)OKAction:(UIButton *)sender{
    [self closeView];
    if (self.delegate && [self.delegate respondsToSelector:@selector(CreateGroupByname:)]) {
        [self.delegate CreateGroupByname:self.textField.text];
    }
}


@end
