//
//  UIFont+runtime.h
//  FamChat
//
//  Created by xgm on 17/11/3.
//  Copyright © 2017年 www.auratech.hk. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 使用runtime,根据手机屏幕的大小自适应字体的大小*/

@interface UIFont (runtime)

+ (UIFont *)adjustFont:(CGFloat)fontSize;

@end
