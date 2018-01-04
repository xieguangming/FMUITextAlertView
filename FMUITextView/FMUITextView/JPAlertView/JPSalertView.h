//
//  JPSalertView.h
//  PopViewOne
//
//  Created by 姜朋升 on 2017/5/22.
//  Copyright © 2017年 闪牛网络. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMTextField.h"

@protocol JPSalertViewDelegate <NSObject>
@optional
- (void)JumpAction;

-(void)CreateGroupByname:(NSString *)name;

@end
@interface JPSalertView : UIView

@property (nonatomic,assign)NSInteger  flags;            //唯一标识符

@property (nonatomic,strong)UILabel  *titleLabel;    //标题

@property (nonatomic,strong)UIImageView  *lineView;    //下划线图片

@property (nonatomic,strong)FMTextField  *textField;    //提示内容

/** 设置代理*/
@property (nonatomic, weak) id<JPSalertViewDelegate> delegate;

- (instancetype)initWithsFrame:(CGRect)frame  AndTitle:(NSString *)title;



-(void)showView;

-(void)closeView;

@end
